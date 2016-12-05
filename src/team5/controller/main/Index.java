package team5.controller.main;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import team5.dao.MyBatisConnectionFactory;
import team5.helper.BaseController;
import team5.helper.PageHelper;
import team5.helper.UploadHelper;
import team5.helper.WebHelper;
import team5.model.Project;
import team5.service.ProjectService;
import team5.service.impl.ProjectServiceImpl;

/**
 * Servlet implementation class Index
 */
@WebServlet("/main/index.do")
public class Index extends BaseController {
	private static final long serialVersionUID = 1L;
	
	
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	PageHelper pageHelper;
	UploadHelper upload;
	ProjectService projectService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		pageHelper = PageHelper.getInstance();
		upload = UploadHelper.getInstance();
		projectService = new ProjectServiceImpl(sqlSession, logger);
		
		/** 조회 조건 값 받아서 view 에 전달 */
		/*String title = web.getString("title");
		String category = web.getString("category");
		String memberId = web.getString("member_id");*/
		String title = null;
		String category = null;
		int memberId = 0;
		request.setAttribute("title", title);
		request.setAttribute("category", category);
		request.setAttribute("memberId", memberId);
		
		/** 조회할 정보에 대한 Beans 생성 */
		
		Project project = new Project();
		project.setTitle(title);
		project.setCategory(category);
		project.setMemberId(memberId);
		
		/** 게시글 목록 조회 */
		List<Project> projectList = null;
		try {
			projectList = projectService.selectProjectThumbList(project);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		/** 조회결과 view 에 전달 */
		request.setAttribute("projectList", projectList);
		
		return "main/index";
		
		
	}
}
