package team5.controller.project;

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
@WebServlet("/project/start.do")
public class Start extends BaseController {

	private static final long serialVersionUID = -1142144002977585903L;

	WebHelper web;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		web = WebHelper.getInstance(request, response);

		// 로그인 중이 아니라면 이 페이지를 동작시키면 안됨.
		/*if (web.getSession("loginInfo") == null) {
			web.redirect(web.getRootPath() + "/main/index.do", "로그인 후 이용 가능합니다.");
			return null;
		}*/

		return "project/start";

	}
}
