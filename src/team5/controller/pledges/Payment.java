package team5.controller.pledges;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team5.helper.BaseController;

/**
 * Servlet implementation class Index
 */
@WebServlet("/pledges/payment.do")
public class Payment extends BaseController {

	private static final long serialVersionUID = 6834814938949315128L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		return "pledges/payment";
		
		
	}
}
