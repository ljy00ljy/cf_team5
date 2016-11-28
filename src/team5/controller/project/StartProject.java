package team5.controller.project;

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
import team5.helper.RegexHelper;
import team5.helper.UploadHelper;
import team5.helper.WebHelper;
import team5.service.ProjectService;
import team5.service.impl.ProjectServiceImpl;

/**
 * Servlet implementation class Index
 */
@WebServlet("/project/start_project.do")
public class StartProject extends BaseController {
	private static final long serialVersionUID = 7831297785081257621L;
	Logger logger;
	WebHelper web;
	SqlSession sqlSession;
	UploadHelper upload;
	RegexHelper regex;

	ProjectService projectService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		web = WebHelper.getInstance(request, response);
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		upload = UploadHelper.getInstance();
		regex = RegexHelper.getInstance();

		projectService = new ProjectServiceImpl(sqlSession, logger);

		// 로그인 중이 아니라면 이 페이지를 동작시키면 안됨.
		/*if (web.getSession("loginInfo") == null) {
			web.redirect(web.getRootPath() + "/main/index.do", "로그인 후 이용 가능합니다.");
			return null;
		}*/

		return "project/start_project";
	}
}
