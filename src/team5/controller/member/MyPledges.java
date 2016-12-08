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
import team5.helper.WebHelper;
import team5.model.Member;
import team5.model.Project;
import team5.service.ProjectService;
import team5.service.impl.ProjectServiceImpl;

/**
 * Servlet implementation class Index
 */
@WebServlet("/member/mypledges.do")
public class MyPledges extends BaseController {
	private static final long serialVersionUID = 8489305810568756329L;
	
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	ProjectService projectService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		projectService = new ProjectServiceImpl(sqlSession, logger);
		
		
		/** 값 받기 */
		int memberId = web.getInt("member_id");
		Member loginInfo = (Member) web.getSession("loginInfo");
		
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
		
		/** 조회할 값 Beans 에 담기 */
		Project project = new Project();
		project.setMemberId(memberId);
		
		/** 후원한 목록 조회 */
		List<Project> projectList = null;
		try {
			projectList = projectService.selectProjectPledgesThumbList(project);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		/** 조회결과 view 에 전달 */
		request.setAttribute("projectList", projectList);
		
		return "member/mypledges";
		
		
	}
}
