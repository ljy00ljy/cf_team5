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
import team5.helper.MailHelper;
import team5.helper.Util;
import team5.helper.WebHelper;
import team5.service.MemberService;
import team5.service.impl.MemberServiceImpl;
@WebServlet("/member/EmailOk.do")
public class EmailOk extends  BaseController {
	private static final long serialVersionUID = -714099336752212309L;
	
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
		
		String item = web.getString("inputNumberCheck");
		logger.debug("item >> " + item);
		if (item == null) {
			sqlSession.close();
			web.redirect(null, "인증번호를 입력하세요.");
			return null;
		}
		boolean myComment = false;
		String emailCf =(String) web.getSession("emailConform");
		logger.debug("emailCf >> " + emailCf);
		if(item.equals(emailCf)){	
			myComment = true;
			request.setAttribute("myComment", myComment);
			web.redirect(null, "인증번호 확인에 성공하였습니다.");
			web.removeSession("emailCf");
			logger.debug("emailCf >> " + web.getSession("emailCf"));
		 	return "/member/join";
		}else{
			web.redirect(null, "인증번호 확인에 실패하였습니다.");
		   return null;
		}
		
	
	
	
		
	}
	
}
