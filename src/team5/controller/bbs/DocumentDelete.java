package team5.controller.bbs;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import team5.dao.MyBatisConnectionFactory;
import team5.helper.BBSCommon;
import team5.helper.BaseController;
import team5.helper.WebHelper;
import team5.model.BbsDocument;
import team5.model.Member;
import team5.service.BbsDocumentService;
import team5.service.impl.BbsDocumentServiceImpl;

/**
 * Servlet implementation class Index
 */
@WebServlet("/bbs/document_delete.do")
public class DocumentDelete extends BaseController {

	private static final long serialVersionUID = -6235520577549437461L;

	/** Helper 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	BBSCommon bbs;
	BbsDocumentService bbsDocumentService;
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		/** Helper + Service 객체 생성 */
		logger=LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession=MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		bbs = BBSCommon.getInstance();
		bbsDocumentService = new BbsDocumentServiceImpl(sqlSession, logger);
		
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
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}
		//55게시글 번호받기 
		int documentId=web.getInt("document_id");
		if(documentId==0){
			sqlSession.close();
			web.redirect(null, "글 번호가 없습니다");
			return null;
		}
		//파라미터를 Beans로 묶기
		BbsDocument document = new BbsDocument();
		document.setId(documentId);
		document.setCategory(category);
		
		//로그인 한 경우 현재 회원의 일련번호를 추가한다.(비로그인시 0으로 설정됨)
		Member loginInfo = (Member) web.getSession("loginInfo");
		if (loginInfo!=null){
			document.setMemberId(loginInfo.getId());
		}
		//게시물 일련번호를 사용한 데이터 조회
		//회원번호가 일치하는 게시물 수 조회하기
		int documentCount = 0;
		try {
			documentCount = bbsDocumentService.selectDocumentCountByMemberId(document);
		}catch (Exception e){
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}finally {
			sqlSession.close();
		}
		
		//자신의 글에 대한 요청인지에 대한 여부를 View에 전달
		boolean myDocument=documentCount > 0;
		request.setAttribute("myDocument", myDocument);
		
		//상태유지를 위하여 게시글 일련번호를 view 에 전달한다.
		request.setAttribute("documentId", documentId);
		// return 명령으로 이동할 위치 설정
		return "bbs/document_delete";
	}
	

}