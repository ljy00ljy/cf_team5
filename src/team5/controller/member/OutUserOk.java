package team5.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import team5.dao.MyBatisConnectionFactory;
import team5.helper.BaseController;
import team5.helper.UploadHelper;
import team5.helper.WebHelper;
import team5.model.BbsComment;
import team5.model.BbsDocument;
import team5.model.Member;
import team5.service.BbsCommentService;
import team5.service.BbsDocumentService;
import team5.service.MemberService;
import team5.service.impl.BbsCommentServiceImpl;
import team5.service.impl.BbsDocumentServiceImpl;
import team5.service.impl.MemberServiceImpl;

/**
 * Servlet implementation class Index
 */
@WebServlet("/member/out_user_ok.do")
public class OutUserOk extends BaseController {

	private static final long serialVersionUID = 7713610047109043223L;

	/** (1) 사용하고자 하는 Helper 객체 선언 */
	// --> import org.apache.logging.log4j.Logger;
	Logger logger;
	// --> import org.apache.ibatis.session.SqlSession;
	SqlSession sqlSession;
	// --> import study.jsp.helper.WebHelper;
	WebHelper web;
	// --> import study.jsp.helper.UploadHelper;
	UploadHelper upload;
	// --> import study.jsp.mysite.service.MemberService;
	MemberService memberService;
	// --> import study.jsp.mysite.service.BbsDocumentService;
	BbsDocumentService bbsDocumentService;
	// --> import study.jsp.mysite.service.BbsCommentService;
	BbsCommentService bbsCommentService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		// --> import org.apache.logging.log4j.LogManager;
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		// --> import study.jsp.mysite.service.impl.MemberServiceImpl;
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		upload = UploadHelper.getInstance();
		// --> import study.jsp.mysite.service.impl.MemberServiceImpl;
		memberService = new MemberServiceImpl(sqlSession, logger);
		// -> import study.jsp.mysite.service.impl.BbsDocumentServiceImpl;
	//	bbsDocumentService = new BbsDocumentServiceImpl(sqlSession, logger);
		// -> import study.jsp.mysite.service.impl.BbsCommentServiceImpl;
	//	bbsCommentService = new BbsCommentServiceImpl(sqlSession, logger);

		/** (3) 로그인 여부 검사 */
		// 로그인 중이 아니라면 탈퇴할 수 없다.
		if (web.getSession("loginInfo") == null) {
			web.redirect(web.getRootPath() + "/main/index.do", "로그인 후에 이용 가능합니다.");
			return null;
		}

		/** (4) 파라미터 받기 */
		String userPw = web.getString("user_pw");
		logger.debug("userPw=" + userPw);

		if (userPw == null) {
			sqlSession.close();
			web.redirect(null, "비밀번호를 입력하세요.");
			return null;
		}

		/** (5) 서비스에 전달하기 위하여 파라미터를 Beans로 묶는다. */
		// 회원번호는 세션을 통해서 획득한 로그인 정보에서 취득.
		Member loginInfo = (Member) web.getSession("loginInfo");
		Member member = new Member();
		member.setId(loginInfo.getId());
		member.setUserPw(userPw);
		
		// 게시판과의 참조 관계 해제를 위한 조건값 설정
		BbsDocument document = new BbsDocument();
		document.setMemberId(loginInfo.getId());
		
		// 덧글과의 참조 관계 해제를 위한 조건값 설정
		BbsComment comment = new BbsComment();
		comment.setMemberId(loginInfo.getId());

		/** (6) Service를 통한 탈퇴 시도 */
		try {
			// 참조관계 해제
	//		bbsDocumentService.updateDocumentMemberOut(document);
	//		bbsCommentService.updateCommentMemberOut(comment);
			// 비밀번호 검사 --> 비밀번호가 잘못된 경우 예외발생
			memberService.selectMemberPasswordCount(member);
			// 탈퇴처리
			memberService.deleteMember(member);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		// 탈퇴되었다면 프로필 이미지를 삭제한다.
		upload.removeFile(loginInfo.getProfileImg());

		/** (7) 정상적으로 탈퇴된 경우 강제 로그아웃 및 페이지 이동 */
		web.removeAllSession();
		web.redirect(web.getRootPath() + "/main/index.do", "탈퇴되었습니다.");
		return null;
	}

}
