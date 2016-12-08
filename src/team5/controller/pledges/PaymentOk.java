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
import team5.helper.RegexHelper;
import team5.helper.WebHelper;
import team5.model.Member;
import team5.model.Pledges;
import team5.model.Project;
import team5.service.PledgesService;
import team5.service.ProjectService;
import team5.service.impl.PledgesServiceImpl;
import team5.service.impl.ProjectServiceImpl;

/**
 * Servlet implementation class PaymentOk
 */
@WebServlet("/pledges/payment_ok.do")
public class PaymentOk extends BaseController {
	private static final long serialVersionUID = -5662632741816020783L;
	
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	RegexHelper regex;
	PledgesService pledgesService;
	ProjectService projectService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		regex = RegexHelper.getInstance();
		pledgesService = new PledgesServiceImpl(sqlSession, logger);
		projectService = new ProjectServiceImpl(sqlSession, logger);
		
		/** 로그인 확인 */
		if (web.getSession("loginInfo") == null) {
			web.redirect(web.getRootPath() + "/main/index.do", "로그인 후 이용 가능합니다.");
			return null;
		}
		/** 세션 id와 넘겨받은 memberId 동일 체크 */
		int memberId = web.getInt("member_id");
		Member member = (Member) web.getSession("loginInfo");
		logger.debug("===== 세션 체크 =====");
		logger.debug("memberId = "+memberId);
		logger.debug("member.id = "+member.getId());
		if (memberId != member.getId()) {
			web.redirect(web.getRootPath() + "/main/index.do", "사용자 정보가 서로 다릅니다.");
			return null;
		}
		
		/** 값 받기 */
		int projectId = web.getInt("project_id");
		int presentId = web.getInt("present_id");
		int fundMoney = web.getInt("fund_money");
		logger.debug("projectId ="+projectId);
		logger.debug("presentId ="+presentId);
		logger.debug("fundMoney ="+fundMoney);
		
		/** Beans 담기 */
		// pledges 저장
		Pledges pledges = new Pledges();
		pledges.setFundMoney(fundMoney);
		pledges.setProjectId(projectId);
		pledges.setPresentId(presentId);
		pledges.setMemberId(memberId);
		logger.debug("pledges ="+pledges);
		// project 업데이트
		Project project = new Project();
		project.setId(projectId);
		project.setNowMoney(fundMoney);
		logger.debug(project);
		
		/** 후원 저장 */
		try {
			pledgesService.insertPledges(pledges);
			projectService.updateProjectMoney(project);
		} catch (Exception e) {
			sqlSession.close(); 
			web.redirect(null, e.getLocalizedMessage());
			return null; 
		} finally {
			sqlSession.close();
		}
		
		/** 값 넘기기 */
		request.setAttribute("pledges", pledges);
		
		/** 기타 입력값 받기, 넘기기 */
		int selectPay = web.getInt("select_pay");
		logger.debug("selectPay ="+selectPay);
		request.setAttribute("selectPay", selectPay);
		
		if (selectPay == 1) {
			// 카드 결제
			String company = web.getString("company");
			int cardBrand = web.getInt("card_brand");
			int cardNumber = web.getInt("card_number");
			String cardYmd = web.getString("card_ymd");
			String cardPassword = web.getString("card_password");
			logger.debug("company ="+company);
			logger.debug("cardBrand ="+cardBrand);
			logger.debug("cardNumber ="+cardNumber);
			logger.debug("cardYmd ="+cardYmd);
			logger.debug("cardPassword ="+cardPassword);
			request.setAttribute("company", company);
			request.setAttribute("cardBrand", cardBrand);
			request.setAttribute("cardNumber", cardNumber);
			request.setAttribute("cardYmd", cardYmd);
			request.setAttribute("cardPassword", cardPassword);
		} else if (selectPay == 2) {
			// 은행 결제
			String company = web.getString("company");
			int bankBrand = web.getInt("bank_brand");
			int bankNumber = web.getInt("bank_number");
			String bankPassword = web.getString("bank_password");
			int juminNumber = web.getInt("jumin_number");
			logger.debug("company ="+company);
			logger.debug("bankBrand ="+bankBrand);
			logger.debug("bankNumber ="+bankNumber);
			logger.debug("bankPassword ="+bankPassword);
			logger.debug("juminNumber ="+juminNumber);
			request.setAttribute("company", company);
			request.setAttribute("bankBrand", bankBrand);
			request.setAttribute("bankNumber", bankNumber);
			request.setAttribute("bankPassword", bankPassword);
			request.setAttribute("juminNumber", juminNumber);
		} else if (selectPay == 3) {
			// 포인트 결제
		}
		
		return "pledges/payment_ok";
	}
	

}
