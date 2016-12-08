package team5.controller.pledges;

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
import team5.model.Present;
import team5.service.PresentService;
import team5.service.impl.PresentServiceImpl;


/** 
 * rewards.jsp 
 * money value=최소값 이하 선택하기 불가
 * 
 *  */
/**
 * Servlet implementation class Index
 */
@WebServlet("/pledges/rewards.do")
public class Rewards extends BaseController {
	private static final long serialVersionUID = 6687982534680813450L;

	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	PresentService presentService;
	
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		presentService = new PresentServiceImpl(sqlSession, logger);
		
		/** 로그인 여부 검사 */
		if (web.getSession("loginInfo") == null) {
			web.redirect(web.getRootPath() + "/member/login.do", "로그인 후 이용 가능합니다.");
			return null;
		}
		
		/** 값 가져오기 */
		int projectId = web.getInt("project_id");
		String title = web.getString("title");
		logger.debug("projectId = "+projectId);
		logger.debug("title ="+title);
		if (projectId == 0) {
			web.redirect(null, "프로젝트 id 가 없습니다.");
			return null;
		}
		
		/** 선물 목록 조회할 Beans 담기 */
		Present present = new Present();
		present.setProjectId(projectId);
		
		/** 검색 */
		List<Present> readPresent = null;
		try {
			readPresent = presentService.selectPresentList(present);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
		} finally {
			sqlSession.close();
		}
		
		
		
		request.setAttribute("readPresent", readPresent);
		request.setAttribute("title", title);
		
		return "pledges/rewards";
		
		
	}
}
