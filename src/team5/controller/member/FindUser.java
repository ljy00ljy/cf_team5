package team5.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import team5.helper.BaseController;
import team5.helper.WebHelper;

/**
 * Servlet implementation class Index
 */
@WebServlet("/member/find_user.do")
public class FindUser extends BaseController {

	private static final long serialVersionUID = 1797229707475437800L;


	/** (1) 사용하고자 하는 Helper 객체 선언 */
	// --> import study.jsp.helper.WebHelper;
	WebHelper web;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		/** (2) 사용하고자 하는 Helper 객체 생성 */
		web = WebHelper.getInstance(request, response);

		/** (3) 로그인 여부 검사 */
		// 로그인 중이라면 이 페이지를 이용할 수 없다.
		if (web.getSession("loginInfo") != null) {
			web.redirect(web.getRootPath() + "/main/index.do", "이미 로그인 중입니다.");
			return null;
		}
		
		/** (4) 사용할 View의 이름 리턴 */
		
		
		return "member/find_user";
		
		
	}
}
