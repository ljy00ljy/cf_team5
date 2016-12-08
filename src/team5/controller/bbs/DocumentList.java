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
import team5.helper.PageHelper;
import team5.helper.UploadHelper;
import team5.helper.WebHelper;
import team5.model.BbsDocument;
import team5.service.BbsDocumentService;
import team5.service.impl.BbsDocumentServiceImpl;

/**
 * Servlet implementation class Index
 */
@WebServlet("/bbs/document_list.do")
public class DocumentList extends BaseController {

	private static final long serialVersionUID = -7030271313194107291L;
	/** Helper 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	BBSCommon bbs;
	BbsDocumentService bbsDocumentService;
	PageHelper pageHelper;
	UploadHelper upload;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/** Helper + Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		bbs = BBSCommon.getInstance();
		bbsDocumentService = new BbsDocumentServiceImpl(sqlSession,logger);
		pageHelper=PageHelper.getInstance();
		upload = UploadHelper.getInstance();
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
		/**(5) 조회할 정보에 대한 Beans 생성 */
		//검색어
		String keyword=web.getString("keyword");
		BbsDocument document = new BbsDocument();
		document.setCategory(category);
		//현재 페이지 수 --> 기본값은 1페이지로 설정함
		int page=web.getInt("page",1);
		//제목과 내용에 대한 검색으로 활용하기 위해서 입력값을 설정한다.
		document.setSubject(keyword);
		document.setContent(keyword);
		
		/**(6) 게시글 목록 조회 */
		int totalCount=0;
		List<BbsDocument> documentList= null;
		//게시판 종류가 갤러리인 경우 사진목록을 함께 조회함을 요청
		document.setGallery(category.equals("gallery"));
		try {
			//전체 게시물 수
			totalCount = bbsDocumentService.selectDocumentCount(document);
			pageHelper.pageProcess(page, totalCount, 10, 5);
			//페이지 번호 계산 결과에서 Limit절에 필요한 값을 Beans에 추가
			document.setLimitStart(pageHelper.getLimitStart());
			document.setListCount(pageHelper.getListCount());
			
			documentList=bbsDocumentService.selectDocumentList(document);
			
		}catch (Exception e){
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}finally {
			sqlSession.close();
		}
		//조회결과가 존재할 경우 --> 갤러리라면 이미지 경로를 썸네일로 교체
		if(document.isGallery()&&documentList!=null){
			for(int i=0; i<documentList.size();i++){
				BbsDocument item= documentList.get(i);
				String imagePath=item.getImagePath();
			
			if(imagePath!=null){
				String thumbPath=upload.createThumbnail(imagePath,480,320,true);
				//글 목록 컬렉션 내의 Beans 객체가 갖는 이미지 경로를 썸네일로 변경한다.
				item.setImagePath(thumbPath);
				logger.debug("thumbnail create > " + item.getImagePath());
			}
		}}
		
		/**(7) 조회 결과를 View에 전달 */
		request.setAttribute("documentList", documentList);
		request.setAttribute("keyword", keyword);
		//페이지 번호 계산 결과를 view에 전달
		request.setAttribute("pageHelper", pageHelper);
		//갤러리 종류라면 View의 이름을 다르게 설정한다.
		String view="bbs/document_list";
		if(document.isGallery()){
			view="bbs/gallery_list";
		}
		
		// return 명령으로 이동할 위치 설정
		return view;
	}
	
}