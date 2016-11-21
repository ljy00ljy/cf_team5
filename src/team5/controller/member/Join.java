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
@WebServlet("/member/join.do")
public class Join extends BaseController {

	private static final long serialVersionUID = -5443133257534469638L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		return "member/join";
		
		
	}
}
