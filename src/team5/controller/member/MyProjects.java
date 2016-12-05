package team5.controller.member;

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
@WebServlet("/member/myprojects.do")
public class MyProjects extends BaseController {
	private static final long serialVersionUID = -5415956030996320288L;
	
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
		
		/** 로그인 여부 검사 - 로그인 상태 아니면 작동 안함 */
		if (web.getSession("loginInfo") == null) {
			web.redirect(web.getRootPath() + "/member/login.do", "로그인 후 이용 가능합니다.");
			return null;
		}
		
		/** 조회 조건 값 받아서 view 에 전달 */
		String title = web.getString("title");
		String category = web.getString("category");
		int memberId = web.getInt("member_id");
		request.setAttribute("title", title);
		request.setAttribute("category", category);
		request.setAttribute("memberId", memberId);
		logger.debug("title = "+title);
		logger.debug("category = "+category);
		logger.debug("memberId = "+memberId);
		
		/** 조회할 정보에 대한 Beans 생성 */
		String keyword = web.getString("keyword");
		Project project = new Project();
		project.setTitle(keyword);
		project.setCategory(category);
		project.setMemberId(memberId);
		logger.debug("project = "+project);
		
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
		// 사용자가 입력한 검색어를 되돌려줌
		request.setAttribute("keyword", keyword);
		
		
		return "member/myprojects";
		
		
	}
}
