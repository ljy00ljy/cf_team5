package team5.controller.bbs;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team5.helper.BBSCommon;
import team5.helper.BaseController;
import team5.helper.WebHelper;

/**
 * Servlet implementation class Index
 */
@WebServlet("/bbs/document_write.do")
public class DocumentWrite extends BaseController {

	private static final long serialVersionUID = -3336110909296231781L;
	/** Helper 객체 선언 */
	WebHelper web;
	BBSCommon bbs;
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/** Helper + Service 객체 생성 */
		web = WebHelper.getInstance(request, response);
		bbs = BBSCommon.getInstance();
		/** Category -> View */
		//webhelper getString 메서드 이용해서 "category"라는 
		//파라미터값을 BbsDocumentMapper->model(BbsDocument) 
		//Beans에서 Mapper로 webhelper를 통해서 값을 받는다.
		String category = web.getString("category");
		//값을 요청해서 속성 설정 view에서 사용할 수 있도록
		request.setAttribute("category", category);
		/** isCategory */
		try {
			String bbsName = bbs.getBbsName(category);
			request.setAttribute("bbsName", bbsName);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}
		
		// return 명령으로 이동할 위치 설정
		return "bbs/document_write";
	}
	

}
