package team5.controller.project;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import team5.dao.MyBatisConnectionFactory;
import team5.helper.BaseController;
import team5.helper.FileInfo;
import team5.helper.RegexHelper;
import team5.helper.UploadHelper;
import team5.helper.WebHelper;

import team5.model.Member;
import team5.model.Present;
import team5.model.Project;

import team5.service.PresentService;
import team5.service.ProjectService;

import team5.service.impl.PresentServiceImpl;
import team5.service.impl.ProjectServiceImpl;

/**
 * Servlet implementation class Index
 */
@WebServlet("/project/start_project_ok.do")
public class StartProjectOk extends BaseController {
	private static final long serialVersionUID = -5305884631821208758L;

	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	RegexHelper regex;
	UploadHelper upload;

	ProjectService projectService;
	PresentService presentService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger = LogManager.getFormatterLogger();
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		regex = RegexHelper.getInstance();
		upload = UploadHelper.getInstance();

		projectService = new ProjectServiceImpl(sqlSession, logger);
		presentService = new PresentServiceImpl(sqlSession, logger);

		/** 로그인 여부 검사 - 로그인 상태 아니면 작동 안함 */
		if (web.getSession("loginInfo") == null) {
			web.redirect(web.getRootPath() + "/member/login.do", "로그인 후 이용 가능합니다.");
			return null;
		}
		
		/** 프로젝트 등록 중이라면 대기 */
		

		/** 파일이 포함된 POST 파라미터 받기 */
		try {
			upload.multipartRequest(request);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, "multipart 데이터가 아닙니다.");
			return null;
		}

		/** 받기 */
		Map<String, String> paramMap = upload.getParamMap();
		// project 받기
		// 프로젝트 개요
		String title = paramMap.get("title");
		String titleS = paramMap.get("title_s");
		String titleText = paramMap.get("title_text");
		String category = paramMap.get("category");
		String url = paramMap.get("url");
		// 진행자 정보
		String producerName = paramMap.get("producer_name");
		String producerInfo = paramMap.get("producer_info");
		String producerArea = paramMap.get("producer_area");
		// 펀딩 목표 설정
		String projectMoney = paramMap.get("project_money");
		String startDate = paramMap.get("start_date");
		String endDate = paramMap.get("end_date");
		// 정책 설정
		String legal = paramMap.get("legal");
		// 스토리텔링
		String video = paramMap.get("video");
		String story = paramMap.get("story");
		String email = paramMap.get("email");
		// 기타
		
		String ipAddress = web.getClientIP();
		String memberId = paramMap.get("member_id");
		// member 받기
		String tel = paramMap.get("tel");
		String bankBrand = paramMap.get("bank_brand");
		String bankNum = paramMap.get("bank_num");
		String bankUser = paramMap.get("bank_user");
		
		
		
		// project logger
		//
		logger.debug("===== project log =====");
		logger.debug(" title = " + title);
		logger.debug(" titleS = " + titleS);
		logger.debug(" titleText = " + titleText);
		logger.debug(" category = " + category);
		logger.debug(" url = " + url);
		//
		logger.debug(" producerName = " + producerName);
		logger.debug(" producerInfo = " + producerInfo);
		logger.debug(" producerArea = " + producerArea);
		//
		logger.debug(" projectMoney = " + projectMoney);
		logger.debug(" startDate = " + startDate);
		logger.debug(" endDate = " + endDate);
		//
		logger.debug(" legal = " + legal);
		//
		logger.debug(" video = " + video);
		logger.debug(" story = " + story);
		logger.debug(" email = " + email);
		//
		
		logger.debug(" ipAddress = " + ipAddress);
		// member logger
		logger.debug("===== member log =====");
		logger.debug("tel = " + tel);
		logger.debug("bankBrand = " + bankBrand);
		logger.debug("bankNum = " + bankNum);
		logger.debug("bankUser = " + bankUser);
		logger.debug(" memberId = " + memberId);

		

		/**
		 * 입력 받은 파라미터에 대한 유효성 검사
		 */
		// project 값 유무 확인
		// 프로젝트 개요
		if (!regex.isValue(title)) {
			sqlSession.close();
			web.redirect(null, "프로젝트 제목을 입력하세요");
			return null;
		}
		if (title.length() > 25) {
			sqlSession.close();
			web.redirect(null, "프로젝트 제목은 한글 25자, 영문+숫자 50자 이내로 입력하세요");
			return null;
		}
		if (!regex.isValue(titleS)) {
			sqlSession.close();
			web.redirect(null, "프로젝트 짧은제목를 입력하세요");
			return null;
		}
		if (titleS.length()>16) {
			sqlSession.close();
			web.redirect(null, "소제목은 한글 8자 이하, 영문+숫자 16자 이하 입력하세요");
			return null;
		}
		
		if (!regex.isValue(titleText)) {
			sqlSession.close();
			web.redirect(null, "프로젝트 개요를 입력하세요");
			return null;
		}
		if (titleText.length() > 20) {
			sqlSession.close();
			web.redirect(null, "프로젝트 요약은 한글 20자, 영문+숫자 40자 이내로 입력하세요");
			return null;
		}
		if (!regex.isValue(category)) {
			sqlSession.close();
			web.redirect(null, "프로젝트 영역을 선택하세요");
			return null;
		}
		// 진행자 정보
		
		if (!regex.isValue(producerName)) {
			sqlSession.close();
			web.redirect(null, "제작자명를 입력하세요");
			return null;
		}
		if (producerName.length() > 20) {
			sqlSession.close();
			web.redirect(null, "진행자 이름은 한글 10자, 영문+숫자 20자 이내로 입력하세요");
			return null;
		}
		if (!regex.isValue(producerInfo)) {
			sqlSession.close();
			web.redirect(null, "제작자 소개를 입력하세요");
			return null;
		}
		if (!regex.isValue(producerArea)) {
			sqlSession.close();
			web.redirect(null, "제작자 활동 지역를 입력하세요");
			return null;
		}
		if (producerArea.length() > 100) {
			sqlSession.close();
			web.redirect(null, "진행자 활동지역은 한글 50자, 영문+숫자 100자 이내로 입력하세요");
			return null;
		}
		// 펀딩목표
		if (!regex.isValue(projectMoney)) {
			sqlSession.close();
			web.redirect(null, "목표금액을 입력하세요");
			return null;
		}
		if (!regex.isNum(projectMoney)) {
			sqlSession.close();
			web.redirect(null, "목표금액은 숫자로만 입력하세요.");
			return null;
		}
		if (projectMoney.length() > 12) {
			sqlSession.close();
			web.redirect(null, "프로젝트 목표 금액은 숫자 12자 이하로 입력하세요");
			return null;
		}
		if (!regex.isValue(startDate)) {
			sqlSession.close();
			web.redirect(null, "모집시작날짜를 입력하세요");
			return null;
		}
		if (!regex.isValue(endDate)) {
			sqlSession.close();
			web.redirect(null, "모집종료날짜을 입력하세요");
			return null;
		}

		// present 카운트 가져오기
		String precount = paramMap.get("precount");
		int count = Integer.parseInt(precount) + 1;
		logger.debug("count + 1 = "+count);
		// present 받기
		for (int i=1; i<count; i++) {
			String cmoney = paramMap.get("pre_money_"+i);
			String cinfo = paramMap.get("pre_info_"+i);
			logger.debug(" money = " + cmoney);
			logger.debug(" info = " + cinfo);
			// 선물 값 유무 검사
			if (!regex.isValue(cmoney)) {
				sqlSession.close();
				web.redirect(null, "선물에 대한 금액은 필수입니다.");
				return null;
			}
			if (!regex.isNum(cmoney)) {
				sqlSession.close();
				web.redirect(null, "선물에 대한 금액은 숫자로만 입력하세요.");
			}
			if (cmoney.length() > 12) {
				sqlSession.close();
				web.redirect(null, "선물에 대한 금액은 숫자 12자 이내로 입력하세요");
				return null;
			}
			if (!regex.isValue(cinfo)) {
				sqlSession.close();
				web.redirect(null, "선물에 대한 보상품은 필수입니다.");
				return null;
			}
			if (cinfo.length() > 200) {
				sqlSession.close();
				web.redirect(null, "선물에 대한 보상품은 한글 100자, 영문+숫자 200자 이내로 입력하세요.");
				return null;
			}
		}
		
		// 정책
		if (!regex.isValue(legal)) {
			sqlSession.close();
			web.redirect(null, "환불 정책를 입력하세요");
			return null;
		}
		// 스토리텔링
		if (!regex.isValue(story)) {
			sqlSession.close();
			web.redirect(null, "스토리를 입력하세요");
			return null;
		}
		// video 체크 안함
		// 계좌 설정
		if (!regex.isValue(email)) {
			sqlSession.close();
			web.redirect(null, "이메일을 입력하세요");
			return null;
		}
		if (!regex.isEmail(email)) {
			sqlSession.close();
			web.redirect(null, "이메일 형식이 다릅니다.");
			return null;
		}
		if (email.length() > 150) {
			sqlSession.close();
			web.redirect(null, "이메일은 영문 150자 이내로 입력하세요");
			return null;
		}
		if (!regex.isValue(tel)) {
			sqlSession.close();
			web.redirect(null, "연락처를 입력하세요");
			return null;
		}
		if (tel.length() > 13) {
			sqlSession.close();
			web.redirect(null, "연락처는 숫자 13자 이내로 입력하세요");
			return null;
		}
		if (!regex.isNum(tel)) {
			sqlSession.close();
			web.redirect(null, "연락처는 숫자로만 입력하세요");
			return null;
		}
		if (!regex.isValue(bankBrand)) {
			sqlSession.close();
			web.redirect(null, "은행명을 입력하세요");
			return null;
		}
		if (bankBrand.length() > 50) {
			sqlSession.close();
			web.redirect(null, "은행명은 한글 25자, 영문+숫자 50자 이내로 입력하세요");
			return null;
		}
		if (!regex.isValue(bankNum)) {
			sqlSession.close();
			web.redirect(null, "계좌번호를 입력하세요");
			return null;
		}
		if (!regex.isNum(bankNum)) {
			sqlSession.close();
			web.redirect(null, "은행계좌는 숫자로만 입력하세요.");
			return null;
		}
		if (bankNum.length() > 20) {
			sqlSession.close();
			web.redirect(null, "은행계좌는 숫자 20자 이내로 입력하세요");
			return null;
		}
		if (!regex.isValue(bankUser)) {
			sqlSession.close();
			web.redirect(null, "예금주를 입력하세요");
			return null;
		}
		if (bankUser.length() > 50) {
			sqlSession.close();
			web.redirect(null, "예금주는 한글 25자, 영문+숫자 50자 이내로 입력하세요");
			return null;
		}
		
		/** 업로드 된 file 정보 추출 */
		List<FileInfo> fileList = upload.getFileList();
		// 업로드된 프로필 사진 경로가 저장될 변수
		String titleImage = null; // 프로젝트 대표 이미지
		String producerImage = null; // 진행자 프로필 이미지
		String producerImageThumb = null; // 진행자 프로필 썸네일 이미지
		// 업로드된 파일이 존재할 경우만 변수값을 할당한다.
		if (fileList.size() > 0) {
			FileInfo info1 = fileList.get(0);
			titleImage = info1.getFileDir() + "/" + info1.getFileName();
			FileInfo info2 = fileList.get(1);
			producerImage = info2.getFileDir() + "/" + info2.getFileName();
			if (producerImage != null) {
				try {
					producerImageThumb = upload.createThumbnail(producerImage, 40, 40, true);
				} catch (Exception e) {
					return null;
				}
			}
		}
		if (!regex.isValue(titleImage)) {
			sqlSession.close();
			web.redirect(null, "프로젝트 대표 이미지를 입력하세요");
			return null;
		}
		if (!regex.isValue(producerImage)) {
			sqlSession.close();
			web.redirect(null, "제작자 이미지를 입력하세요");
			return null;
		}
		// image logger
		logger.debug("titleImage = " + titleImage);
		logger.debug("producerImage = " + producerImage);
		

		// present logger
		// logger.debug("===== present log =====");

		// project 담기
		Project project = new Project();
		//
		project.setTitle(title);
		project.setTitleS(titleS);
		project.setTitleImage(titleImage);
		project.setTitleText(titleText);
		project.setCategory(category);
		project.setUrl(url);
		//
		project.setProducerImage(producerImage);
		project.setProducerImageThumb(producerImageThumb);
		project.setProducerName(producerName);
		project.setProducerInfo(producerInfo);
		project.setProducerArea(producerArea);
		//
		project.setProjectMoney(Integer.parseInt(projectMoney)); // 숫자로 형변환
		project.setStartDate(startDate);
		project.setEndDate(endDate);
		//
		project.setLegal(legal);
		//
		// video 문자열 추출 후 재조립
		String reVideo = "";
		if (video != "") {
			reVideo = video.substring(video.lastIndexOf("/"), video.length());
		}
		
		project.setVideo(reVideo);
		project.setStory(story);
		//
		project.setEmail(email);
		//
		
		project.setIpAddress(ipAddress);
		project.setMemberId(Integer.parseInt(memberId));
		logger.debug("project >> " + project.toString());
		
		// member 담기
		Member member = new Member();
		member.setTel(tel);
		member.setBankBrand(bankBrand);
		member.setBankNum(bankNum);
		member.setBankUser(bankUser);
		member.setId(Integer.parseInt(memberId));
		logger.debug("member >> " + member.toString());
		
		
		/**
		 * 저장 처리
		 */
		try { 
			// project 저장
			projectService.insertProject(project);
			// project 저장 후 방금 저장한 project id 가져오기
			Project nowProject = null;
			nowProject = projectService.selectInsertNowProjectId(project);
			int nowProjectId = nowProject.getId();
			logger.debug("nowProjectId = "+nowProjectId);
			// present 저장
			for (int i = 1; i < count; i++) {
				// present 받기
				String sMoney = paramMap.get("pre_money_"+i);
				String sInfo = paramMap.get("pre_info_"+i);
				logger.debug("smoney ="+sMoney);
				logger.debug("sinfo ="+sInfo);
				// present 담기
				Present present = new Present();
				present.setMoney(Integer.parseInt(sMoney));
				present.setInfo(sInfo);
				present.setProjectId(nowProjectId);
				logger.debug(present.toString());
				// present 저장
				presentService.insertPresent(present);
			}
			// member 저장
			projectService.updateProjectMember(member);
		} catch (Exception e) {
			sqlSession.close(); 
			web.redirect(null, e.getLocalizedMessage());
			return null; 
		} finally {
			sqlSession.close();
		}

		request.setAttribute("memberId", memberId);
		// session 변경
				
		return "project/start_project_ok";
	}
}
