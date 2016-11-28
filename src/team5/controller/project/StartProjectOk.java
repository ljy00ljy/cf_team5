package team5.controller.project;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import team5.helper.BaseController;
import team5.helper.WebHelper;

/**
 * Servlet implementation class Index
 */
@WebServlet("/project/start_project_ok.do")
public class StartProjectOk extends BaseController {
	private static final long serialVersionUID = -5305884631821208758L;
	
	WebHelper web;
	SqlSession sqlSession;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		return "project/start_project_ok";
	}
}
