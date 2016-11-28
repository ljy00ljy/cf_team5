package team5.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import team5.model.Project;
import team5.service.ProjectService;

public class ProjectServiceImpl implements ProjectService {
	
	/** 처리 결과를 기록할 Log4J 객체 생성 */
	Logger logger;
	/** MyBatis */
	SqlSession sqlSession;
	/** 생성자를 통한 객체 생성 */
	public ProjectServiceImpl (SqlSession sqlSession, Logger logger) {
		this.sqlSession = sqlSession;
		this.logger = logger;
	}
	
	@Override
	public void insertProject(Project project) throws Exception {
	
		try {
			int result = sqlSession.insert("ProjectMapper.insert_project", project);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("저장된 프로젝트 없음.");
		} catch (Exception e) {
			sqlSession.rollback();
			throw new Exception("프로젝트 저장에 실패.");
		} finally {
			sqlSession.commit();
		}
		
	}

}
