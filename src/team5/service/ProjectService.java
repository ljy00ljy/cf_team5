package team5.service;

import team5.model.Project;

public interface ProjectService {
	/**
	 * 신규 프로젝트 생성
	 * @param project - 프로젝트 데이터
	 * @throw Exception
	 */
	public void insertProject(Project project) throws Exception;
}
