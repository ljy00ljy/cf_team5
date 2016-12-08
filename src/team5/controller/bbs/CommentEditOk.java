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



@WebServlet("/bbs/comment_edit_ok.do")
public class CommentEditOk extends BaseController {
	private static final long serialVersionUID = 6352239483054167771L;
	
	/** (1) 사용하고자 하는 Helper 객체 선언 */
	// --> import org.apache.logging.log4j.Logger;
	Logger logger;
	// --> import org.apache.ibatis.session.SqlSession;
	SqlSession sqlSession;
	// --> import study.jsp.helper.WebHelper;
	WebHelper web;
	// --> import study.jsp.helper.RegexHelper;
	RegexHelper regex;
	// --> import study.jsp.mysite.service.BbsCommentService;
	BbsCommentService bbsCommentService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		/** (2) 페이지 형식 지정 + 사용하고자 하는 Helper+Service 객체 생성 */
		// 페이지 형식을 JSON으로 설정한다.
		response.setContentType("application/json");
		
		// --> import org.apache.logging.log4j.LogManager;
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		// --> import study.jsp.mysite.service.impl.MemberServiceImpl;
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		regex = RegexHelper.getInstance();
		// --> import study.jsp.mysite.service.impl.BbsCommentServiceImpl;
		bbsCommentService = new BbsCommentServiceImpl(sqlSession, logger);

		/** (3) 파라미터 받기 */
		int commentId = web.getInt("comment_id");
		String writerName = web.getString("writer_name");
		String content = web.getString("content");
		// 작성자 아이피 주소 가져오기
		String ipAddress = web.getClientIP();
		// 회원 일련번호 --> 비 로그인인 경우 0
		int memberId = 0;

		// 전달된 파라미터는 로그로 확인한다.
		logger.debug("comment_id=" + commentId);
		logger.debug("writer_name=" + writerName);
		logger.debug("content=" + content);
		logger.debug("ipAddress=" + ipAddress);
		logger.debug("memberId=" + memberId);

		/** (4) 로그인 한 경우 자신의 글이라면 입력하지 않은 정보를 세션 데이터로 대체한다. */
		// 소유권 검사 정보
		boolean myComment = false;
		
		Member loginInfo = (Member) web.getSession("loginInfo");
		if (loginInfo != null) {
			try {
				// 소유권 판정을 위하여 사용하는 임시 객체
				BbsComment temp = new BbsComment();
				temp.setId(commentId);
				temp.setMemberId(loginInfo.getId());

				if (bbsCommentService.selectCommentCountByMemberId(temp) > 0) {
					// 소유권을 의미하는 변수 변경
					myComment = true;
					// 입력되지 않은 정보들 갱신
					writerName = loginInfo.getName();

					memberId = loginInfo.getId();
				}
			} catch (Exception e) {
				sqlSession.close();
				web.printJsonRt(e.getLocalizedMessage());
				return null;
			}
		}

		// 전달된 파라미터는 로그로 확인한다.
		logger.debug("commentId=" + commentId);
		logger.debug("writer_name=" + writerName);

		logger.debug("content=" + content);
		logger.debug("ipAddress=" + ipAddress);
		logger.debug("memberId=" + memberId);

		/** (5) 입력 받은 파라미터에 대한 유효성 검사 */
		if (commentId == 0) {
			sqlSession.close();
			web.printJsonRt("덧글 번호가 없습니다.");
			return null;
		}
		
		// 이름 + 비밀번호
		if (!regex.isValue(writerName)) {
			sqlSession.close();
			web.printJsonRt("본인의 뎃글이 아닙니다.");
			return null;
		}

	

		if (!regex.isValue(content)) {
			sqlSession.close();
			web.printJsonRt("내용을 입력하세요.");
			return null;
		}

		/** (6) 입력 받은 파라미터를 Beans로 묶기 */
		BbsComment comment = new BbsComment();
		// UPDATE문의 WHERE절에서 사용해야 하므로 덧글 번호 추가
		comment.setId(commentId);
		comment.setWriterName(writerName);

		comment.setContent(content);
		comment.setIpAddress(ipAddress);
		comment.setMemberId(memberId);
		logger.debug(comment.toString());

		/** (7) 게시물 변경을 위한 Service 기능을 호출 */
		BbsComment item = null;
		try {
			// 자신의 글이 아니라면 비밀번호 검사를 먼저 수행한다.
			if (!myComment) {
				bbsCommentService.selectCommentCountByPw(comment);
			}
			bbsCommentService.updateComment(comment);
			// 변경된 결과를 조회
			item = bbsCommentService.selectComment(comment);
		} catch (Exception e) {
			web.printJsonRt(e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		/** (8) 처리 결과를 JSON으로 출력하기 */
		// 줄바꿈이나 HTML특수문자에 대한 처리
		item.setWriterName(web.convertHtmlTag(item.getWriterName()));

		item.setContent(web.convertHtmlTag(item.getContent()));
		
		// --> import java.util.HashMap;
		// --> import java.util.Map;
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("rt", "OK");
		data.put("item", item);
		
		// --> import com.fasterxml.jackson.databind.ObjectMapper;
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), data);

		return null;
	}

}
