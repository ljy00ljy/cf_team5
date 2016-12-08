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

/**
 * Servlet implementation class PaymentSelect
 */
@WebServlet("/pledges/payment_select.do")
public class PaymentSelect extends BaseController {
	private static final long serialVersionUID = -2003539934041798404L;
	
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		
		/** 로그인 여부 검사 - 로그인 상태 아니면 작동 안함 */
		if (web.getSession("loginInfo") == null) {
			web.redirect(web.getRootPath() + "/member/login.do", "로그인 후 이용 가능합니다.");
			return null;
		}
		
		/** 값 받기 */
		int selectPay = web.getInt("select_pay");
		Member member = (Member) web.getSession("loginInfo");
		int memberId = member.getId();
		int projectId = web.getInt("project_id");
		int presentId = web.getInt("present_id");
		int fundMoney = web.getInt("fund_money");
		logger.debug("selectPay= "+selectPay);
		logger.debug("memberId= "+memberId);
		logger.debug("projectId= "+projectId);
		logger.debug("presentId= "+presentId);
		logger.debug("fundMoney= "+fundMoney);
		
		/** 값 확인 */
		if (selectPay == 0) {
			sqlSession.close();
			web.redirect(null, "결제수단 선택이 없습니다.");
			return null;
		}
		if (memberId == 0) {
			sqlSession.close();
			web.redirect(null, "회원이 없습니다.");
			return null;
		}
		if (projectId == 0) {
			sqlSession.close();
			web.redirect(null, "선택한 프로젝트가 없습니다.");
			return null;
		}
		if (fundMoney == 0) {
			sqlSession.close();
			web.redirect(null, "입력한 금액이 없습니다.");
			return null;
		}
		
		/** 담기 */
		Pledges pledges = new Pledges();
		pledges.setFundMoney(fundMoney);
		pledges.setProjectId(projectId);
		pledges.setMemberId(memberId);
		pledges.setPresentId(presentId);
		
		/** 페이지에 전달 */
		request.setAttribute("readPledges", pledges);
		request.setAttribute("selectPay", selectPay);
		
		
		/** 결제창 변경 */
		String pageSelect = null;
		if (selectPay == 1) {
			pageSelect = "pledges/payment_card_modal";
		} else if (selectPay == 2) {
			pageSelect = "pledges/payment_bank_modal";
		} else if (selectPay == 3) {
			pageSelect = "pledges/payment_point_modal";
		}
		return pageSelect;
	}
	
	
}
