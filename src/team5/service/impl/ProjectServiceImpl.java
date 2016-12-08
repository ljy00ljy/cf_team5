package team5.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import team5.model.Member;
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
			logger.error(e.getLocalizedMessage());
			throw new Exception("저장된 프로젝트 없음.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("프로젝트 저장에 실패.");
		} finally {
			sqlSession.commit();
			
		}
		
	}

	@Override
	public Project selectInsertNowProjectId(Project project) throws Exception {
		Project result = null;
		
		try {
			result = sqlSession.selectOne("ProjectMapper.select_insert_now_project_id", project);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("조회된 id가 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("id 조회에 실패했습니다.");
		}
		
		return result;
	}

	@Override
	public int countInsertProjectDelay(int pcount) throws Exception {
		int result = 0;
		try {
			result = sqlSession.selectOne("ProjectMapper.count_insert_project_delay", pcount);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("등록중인 프로젝트 조회에 실패했습니다.");
		}
		
		return result;
	}

	@Override
	public List<Project> selectProjectThumbList(Project project) throws Exception {
		List<Project> result = null;
		try {
			result = sqlSession.selectList("ProjectMapper.select_project_thumb_list", project);
			if(result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("조회된 프로젝트 목록이 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("프로젝트 목록 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public void updateProjectMember(Member member) throws Exception {
		try {
			int result = sqlSession.update("MemberMapper.update_project_member", member);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("변경된 회원정보가 없습니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("회원정보 수정에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
		
	}

	@Override
	public Project selectProject(Project project) throws Exception {
		Project result = null;
		try {
			result = sqlSession.selectOne("ProjectMapper.select_project", project);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.close();
			throw new Exception("조회된 한개의 프로젝트 정보가 없습니다.");
		} catch (Exception e) {
			sqlSession.close();
			logger.error(e.getLocalizedMessage());
			throw new Exception("프로젝트 한개 조회에 실패.");
		}
		return result;
	}

	@Override
	public void updateProjectMoney(Project project) throws Exception {
		try {
			int result = sqlSession.update("ProjectMapper.update_project_money", project);
			if(result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new NullPointerException("변경된 프로젝트 투자가 없습니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("프로젝트 투자에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
		
	}

	@Override
	public List<Project> selectProjectPledgesThumbList(Project project) throws Exception {
		List<Project> result = null;
		try {
			result = sqlSession.selectList("ProjectMapper.select_project_pledges_thumb_list", project);
			if(result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("조회된 프로젝트 목록이 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("프로젝트 목록 조회에 실패했습니다.");
		}
		return result;
	}

}
