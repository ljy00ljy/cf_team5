package team5.controller.member;

import java.io.IOException;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import team5.dao.MyBatisConnectionFactory;
import team5.helper.BaseController;
import team5.helper.MailHelper;
import team5.helper.Util;
import team5.helper.WebHelper;
import team5.model.Member;
import team5.service.MemberService;
import team5.service.impl.MemberServiceImpl;



/**
 * Servlet implementation class Index
 */
@WebServlet("/member/email.do")
public class Email extends BaseController {
	private static final long serialVersionUID = -3027107442549398943L;
	
	/** (1) 사용하고자 하는 Helper 객체 선언 */
	// --> import org.apache.logging.log4j.Logger;
	Logger logger;
	// --> import org.apache.ibatis.session.SqlSession;
	SqlSession sqlSession;
	// --> import study.jsp.helper.WebHelper;
	WebHelper web;
	// --> import study.jsp.helper.MailHelper;
	MailHelper mail;
	// --> import study.jsp.helper.Util;
	Util util;
	
	// --> import study.jsp.mysite.service.MemberService;
		MemberService memberService;

	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		// --> import org.apache.logging.log4j.LogManager;
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		// --> import study.jsp.mysite.service.impl.MemberServiceImpl;
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		mail = MailHelper.getInstance();
		util = Util.getInstance();

		// --> import study.jsp.mysite.service.impl.MemberServiceImpl;
				memberService = new MemberServiceImpl(sqlSession, logger);
				
		/** (3) 로그인 여부 검사 */
		// 로그인 중이라면 이 페이지를 이용할 수 없다.
		if (web.getSession("loginInfo") != null) {
			sqlSession.close();
			web.redirect(web.getRootPath() + "/main/index.do", "이미 로그인 중입니다.");
			return null;
		}
		
		/** (4) 파라미터 받기 */
		// 입력된 메일 주소를 받는다.
		String inEmail = web.getString("inputEmail");
        logger.debug("inEmail=" + inEmail);
		
       
        Member member = new Member();
        member.setUserId(inEmail);
    	try {
			memberService.selectUserIdCount(member);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, "등록된 아이디 입니다");
			// 예외가 발생한 경우이므로, 더이상 진행하지 않는다.
			return null;
		}
        
		if (inEmail == null) {
			sqlSession.close();
			web.redirect(null, "인증 이메일을 입력하세요.");
			return null;
		}
		
		/** (5) 임시 인증번호 생성하기 */
		String emailConform = util.getRandomPassword();
		logger.debug("emailConform === " + emailConform);

		

		
		/** (8) 발급된 비밀번호를 메일로 발송하기 */
		String sender = "cf@mysite.com";
		String subject = "cf 이메일 인증 안내 입니다.";
		String content = "회원님의 인증번호는 <strong>" + emailConform + "</strong>입니다.";
		
		try {
			// 사용자가 입력한 메일주소를 수신자로 설정하여 메일 발송하기
			mail.sendMail(sender, inEmail, subject, content);
		} catch (MessagingException e) {
			web.redirect(null, "메일 발송에 실패했습니다. 관리자에게 문의 바랍니다.");
			return null;
		}
		
		
		/** (9) 결과 페이지로 이동 */
		// 여기서는 이전 페이지로 이동함
		web.redirect(null, "이메일 인증번호가 메일로 발송되었습니다.");
		
		
		
		


		web.setSession("inEmail", inEmail);
		web.setSession("emailConform", emailConform);
		
		return null;
		
		
	}

}