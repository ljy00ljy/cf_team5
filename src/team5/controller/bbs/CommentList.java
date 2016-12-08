package team5.controller.bbs;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.fasterxml.jackson.databind.ObjectMapper;

import team5.dao.MyBatisConnectionFactory;
import team5.helper.BaseController;
import team5.helper.RegexHelper;
import team5.helper.WebHelper;
import team5.model.BbsComment;
import team5.service.BbsCommentService;
import team5.service.impl.BbsCommentServiceImpl;


@WebServlet("/bbs/comment_list.do")
public class CommentList extends BaseController {



	/**
	 * 
	 */
	private static final long serialVersionUID = -6080389535440276523L;
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	RegexHelper regex;
	BbsCommentService bbsCommentService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		regex = RegexHelper.getInstance();
		bbsCommentService = new BbsCommentServiceImpl(sqlSession, logger);
		
		int bbsDocumentId = web.getInt("document_id");
		logger.debug("bbs_document_id="+bbsDocumentId);
		
		/** 입력받은 파라미터에 대한 유효성 검사 */
		//덧글이 소속될 게시물의 일련번호
		if(bbsDocumentId ==0){
			sqlSession.close();
			web.printJsonRt("게시물 일련번호가 없습니다.");
			return null;
		}
		/** 입력 받은 파라미터를 Beans로 묶기 */
		BbsComment comment = new BbsComment();
		comment.setBbsDocumentId(bbsDocumentId);
		
		/** Service를 통한 덧글 목록 조회 */
		//작성 결과를 저장할 객체
		List<BbsComment> item = null;
		try {
			item=bbsCommentService.selectCommentList(comment);
		}catch (Exception e){
			web.printJsonRt(e.getLocalizedMessage());
			return null;
		}finally {
			sqlSession.close();
		}
		/** 처리 결과를 JSON으로 출력하기 */
		//줄 바꿈이나 HTML 특수 문자에 대한 처리
		for (int i=0; i<item.size(); i++){
			BbsComment temp = item.get(i);
			temp.setWriterName(web.convertHtmlTag(temp.getWriterName()));
			
			temp.setContent(web.convertHtmlTag(temp.getContent()));
		}
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("rt","OK");
		data.put("item",item);
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), data);
		
		return null;

	}
}
