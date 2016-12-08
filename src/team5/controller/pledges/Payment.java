package team5.controller.pledges;

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
import team5.helper.WebHelper;
import team5.model.Member;
import team5.model.Pledges;
import team5.service.PledgesService;
import team5.service.impl.PledgesServiceImpl;

/**
 * Servlet implementation class Index
 */
@WebServlet("/pledges/payment.do")
public class Payment extends BaseController {
	private static final long serialVersionUID = 6834814938949315128L;

	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	PledgesService pledgesService;
	
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		pledgesService = new PledgesServiceImpl(sqlSession, logger);
		
		/** 로그인 여부 검사 */
		if (web.getSession("loginInfo") == null) {
			web.redirect(web.getRootPath() + "/member/login.do", "로그인 후 이용 가능합니다.");
			return null;
		}
		
		/** 값 받아오기 */
		int fundMoney = web.getInt("fund_money");
		int projectId = web.getInt("project_id");
		Member member = (Member) web.getSession("loginInfo");
		int memberId = member.getId();
		int presentId = web.getInt("present_id");
		String title = web.getString("title");
		String info = web.getString("info");
		logger.debug("fundMoney = "+fundMoney);
		logger.debug("projectId = "+projectId);
		logger.debug("memberId = "+memberId);
		logger.debug("presentId = "+presentId);
		logger.debug("title ="+title);
		logger.debug("info ="+info);
		
		/** Beans 담기 */
		Pledges pledges = new Pledges();
		pledges.setFundMoney(fundMoney);
		pledges.setProjectId(projectId);
		pledges.setMemberId(memberId);
		pledges.setPresentId(presentId);
		logger.debug(pledges.toString());
		
		/** 값 전달 */
		request.setAttribute("readPledges", pledges);
		request.setAttribute("title", title);
		request.setAttribute("info", info);
		
		return "pledges/payment";
		
		
	}
}
