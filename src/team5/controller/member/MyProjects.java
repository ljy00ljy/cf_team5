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
import team5.model.Member;
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
		
		/** 로그인 값 받기 */
		Member loginInfo = (Member) web.getSession("loginInfo");
		int memberId = web.getInt("member_id");
		logger.debug(memberId);
		
		/** 로그인 체크 */
		if (loginInfo == null) {
			web.redirect(web.getRootPath() + "/main/index.do", "로그인 정보가 없습니다.");
			return null;
		}
		
		/** memberId 와 loginSession id 체크 */
		if (loginInfo.getId() != memberId) {
			web.redirect(web.getRootPath() + "/main/index.do", "로그인 정보가 다릅니다.");
			return null;
		}
		
		// 값 Beans 로 넣기
		Project project = new Project();
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
		
		
		
		return "member/myprojects";
		
		
	}
}
