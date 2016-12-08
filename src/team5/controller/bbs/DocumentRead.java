package team5.controller.bbs;

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
import team5.helper.BBSCommon;
import team5.helper.BaseController;
import team5.helper.WebHelper;
import team5.model.BbsDocument;
import team5.model.File;
import team5.service.BbsDocumentService;
import team5.service.FileService;
import team5.service.impl.BbsDocumentServiceImpl;
import team5.service.impl.FileServiceImpl;

/**
 * Servlet implementation class Index
 */
@WebServlet("/bbs/document_read.do")
public class DocumentRead extends BaseController {

	private static final long serialVersionUID = 887441562744306982L;

	/** Helper 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	BBSCommon bbs;
	BbsDocumentService bbsDocumentService;
	FileService fileService;
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/** Helper + Service 객체 생성 */
		logger=LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession=MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		bbs = BBSCommon.getInstance();
		bbsDocumentService= new BbsDocumentServiceImpl(sqlSession,logger);
		fileService = new FileServiceImpl(sqlSession, logger);
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
			//Exception상황에서 sqlSession을 반드시 종료한다.
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}
		//5
		int documentId=web.getInt("document_id");
		logger.debug("documentId="+ documentId);
		if(documentId==0){
			web.redirect(null, "글 번호가 지정되지 않았습니다.");
			sqlSession.close();
			return null;
		}
		//파라미터를 Beans로 묶기
		BbsDocument document = new BbsDocument();
		document.setId(documentId);
		document.setCategory(category);
		
		File file= new File();
		file.setBbsDocumentId(documentId);
		
		//6
		BbsDocument readDocument = null;
		BbsDocument prevDocument = null;
		BbsDocument nextDocument = null;
		List<File> fileList = null;
		
		String cookieKey = "document_" + category + "_" + documentId;
		String cookieVar = web.getCookie(cookieKey);
		
		try {
			if (cookieVar == null){
				bbsDocumentService.updateDocumentHit(document);
				web.setCookie(cookieKey, "Y", 1);
			}
			readDocument = bbsDocumentService.selectDocument(document);
			prevDocument = bbsDocumentService.selectPrevDocument(document);
			nextDocument = bbsDocumentService.selectNextDocument(document);
			fileList = fileService.selectFileList(file);
		}catch(Exception e){
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}finally {
			sqlSession.close();
		}
		//7
		request.setAttribute("readDocument", readDocument);
		request.setAttribute("prevDocument", prevDocument);
		request.setAttribute("nextDocument", nextDocument);
		request.setAttribute("fileList", fileList);
		
		
	
		// return 명령으로 이동할 위치 설정
		return "bbs/document_read";
	}
	

}
