package team5.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import team5.model.Present;
import team5.service.PresentService;

public class PresentServiceImpl implements PresentService {
	
	/** 처리 결과를 기록할 Log4J 객체 생성 */
	Logger logger;
	/** MyBatis */
	SqlSession sqlSession;
	/** 생성자를 통한 객체 생성 */
	public PresentServiceImpl (SqlSession sqlSession, Logger logger) {
		this.sqlSession = sqlSession;
		this.logger = logger;
	}
	
	@Override
	public void insertPresent(Present present) throws Exception {
		
		try {
			int result = sqlSession.insert("PresentMapper.insert_present", present);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("저장된 보상품 없음.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("보상품 저장에 실패.");
		} finally {
			sqlSession.commit();
		}
		
	}
	
	
	
}
