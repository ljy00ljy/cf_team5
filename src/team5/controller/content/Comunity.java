package team5.controller.content;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team5.helper.BaseController;

/**
 * Servlet implementation class Index
 */
@WebServlet("/content/comunity.do")
public class Comunity extends BaseController {

	private static final long serialVersionUID = 7902311970781015107L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		return "content/comunity";
		
		
	}
}
