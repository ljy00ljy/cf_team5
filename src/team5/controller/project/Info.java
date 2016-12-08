package team5.controller.project;

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
import team5.helper.RegexHelper;
import team5.helper.UploadHelper;
import team5.helper.WebHelper;
import team5.model.Present;
import team5.model.Project;
import team5.service.PresentService;
import team5.service.ProjectService;
import team5.service.impl.PresentServiceImpl;
import team5.service.impl.ProjectServiceImpl;

/**
 * Servlet implementation class Index
 */
@WebServlet("/project/info.do")
public class Info extends BaseController {
	private static final long serialVersionUID = 4969105085728740703L;
	
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	RegexHelper regex;
	UploadHelper upload;
	ProjectService projectService;
	PresentService presentService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		regex = RegexHelper.getInstance();
		upload = UploadHelper.getInstance();
		projectService = new ProjectServiceImpl(sqlSession, logger);
		presentService = new PresentServiceImpl(sqlSession, logger);
		
		int projectId = web.getInt("id");
		if (projectId == 0) {
			sqlSession.close();
			web.redirect(null, "프로젝트 번호가 지정되지 않았습니다.");
			return null;
		}
		int presentId = projectId;
		
		/** 조회할 Beans 로 묶기 */
		Project project = new Project();
		project.setId(projectId);
		
		Present present = new Present();
		present.setProjectId(presentId);
		
		// 조회 후 view 에 값 넘길 객체
		Project readProject = null;
		List<Present> readPresent = null;
		
		/** Beans 넣어서 값 조회 */
		try {
			readProject = projectService.selectProject(project);
			readPresent = presentService.selectPresentList(present);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
		} finally {
			sqlSession.close();
		}
		logger.debug("readProject = "+readProject.toString());
		logger.debug("readPresent = "+readPresent.toString());
		/** 조회된 값 view 에 전달 */
		request.setAttribute("readProject", readProject);
		request.setAttribute("readPresent", readPresent);
		
		return "project/info";
		
		
	}
}
