package team5.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team5.helper.BaseController;

/**
 * Servlet implementation class Index
 */
@WebServlet("/member/myprojects.do")
public class MyProjects extends BaseController {

	private static final long serialVersionUID = -5415956030996320288L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		return "member/myprojects";
		
		
	}
}
