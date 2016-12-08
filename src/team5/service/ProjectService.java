package team5.service;

import java.util.List;

import team5.model.Member;
import team5.model.Project;

public interface ProjectService {
	/**
	 * 신규 프로젝트 생성
	 * @param project - 프로젝트 데이터
	 * @throw Exception
	 */
	public void insertProject(Project project) throws Exception;
	
	/**
	 * 방금 저장한 프로젝트 id 조회
	 * 
	 */
	public Project selectInsertNowProjectId(Project project) throws Exception;
	
	/**
	 * 프로젝트 등록 대기중 조회
	 */
	public int countInsertProjectDelay(int pcount) throws Exception;
	
	/**
	 * 프로젝트 썸네일 조회
	 */
	public List<Project> selectProjectThumbList(Project project) throws Exception;
	
	/**
	 * 프로젝트에 의한 회원정보 수정
	 * @param member
	 * @throws Exception
	 */
	public void updateProjectMember(Member member) throws Exception;
	
	/**
	 * 프로젝트 한개 조회
	 * @param project
	 * @throws Exception
	 */
	public Project selectProject(Project project) throws Exception;
	
	/**
	 * 프로젝트 투자금액 업데이트
	 * @param project
	 * @throws Exception
	 */
	public void updateProjectMoney(Project project) throws Exception;
	
	/** 투자한 프로젝트 조회
	 * @param project
	 * @throws Exception
	 */
	public List<Project> selectProjectPledgesThumbList(Project project) throws Exception; 
}
