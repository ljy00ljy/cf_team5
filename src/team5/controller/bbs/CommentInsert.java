package team5.controller.bbs;

import java.io.IOException;
import java.util.HashMap;
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
import team5.model.Member;
import team5.service.BbsCommentService;
import team5.service.impl.BbsCommentServiceImpl;



@WebServlet("/bbs/comment_insert.do")
public class CommentInsert extends BaseController {


	private static final long serialVersionUID = -9059830806177039186L;
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
		String writerName = web.getString("writer_name");
		String content = web.getString("content");
		int hit = web.getInt("hit");
		//작성자 아이피 주소 가져오기
		String ipAddress = web.getClientIP();
		//회원 일련번호 --> 비 로그인인 경우 0
		int memberId=0;
		
		//로그인 한 경우 , 입력하지 않은 이름 , 비밀번호, 이메일을 세션정보에 대체
		Member loginInfo = (Member) web.getSession("loginInfo");
		if(loginInfo != null){
			writerName = loginInfo.getName();
			memberId = loginInfo.getId();
		}
		
		//전달된 파라미터는 로그로 확인한다. 
		logger.debug("bbs_document_id=" + bbsDocumentId);
		logger.debug("writer_name=" + writerName);

		logger.debug("content=" + content);
		logger.debug("hit=" + hit);
		logger.debug("ipAddress=" + ipAddress);
		logger.debug("memberId=" + memberId);
		
		/** 입력 받는 파라미터에 대한 유효성 검사 */
		if(bbsDocumentId == 0) {
			sqlSession.close();
			web.printJsonRt("게시물 일련번호가 없습니다.");
			return null;
			}
		if(!regex.isValue(writerName)){
			sqlSession.close();
			web.printJsonRt("로그인 후 입력하세요.");
			return null;
			}

		if(!regex.isValue(content)){
			sqlSession.close();
			web.printJsonRt("내용을 입력하세요.");
			return null;
			}
		/** 입력 받는 파라미터를 Beans로 묶기 */
		BbsComment comment = new BbsComment();
		comment.setBbsDocumentId(bbsDocumentId);
	    comment.setWriterName(writerName);

		comment.setContent(content);
		comment.setIpAddress(ipAddress);
		comment.setMemberId(memberId);
		
		logger.debug("comment >> " + comment.toString());
		
		/** Service를 통한 덧글 저장 */
		BbsComment item = null;
		
		try {
			bbsCommentService.insertComment(comment);
			item=bbsCommentService.selectComment(comment);
		}catch (Exception e){
			web.printJsonRt(e.getLocalizedMessage());
			return null;
		}finally{
			sqlSession.close();
		}
		/** 처리 결과를 JSON으로 출력하기 */
		Map<String, Object>data = new HashMap<String, Object>();
		data.put("rt","OK");
		data.put("item",item);
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), data);
		
		return null;
	}

}
