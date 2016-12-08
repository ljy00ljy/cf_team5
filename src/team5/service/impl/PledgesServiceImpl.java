package team5.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import team5.model.Pledges;
import team5.service.PledgesService;

public class PledgesServiceImpl implements PledgesService {
	
	/** 처리 결과를 기록할 Log4J 객체 생성 */
	Logger logger;
	/** MyBatis */
	SqlSession sqlSession;
	/** 생성자를 통한 객체 생성 */
	public PledgesServiceImpl (SqlSession sqlSession, Logger logger) {
		this.sqlSession = sqlSession;
		this.logger = logger;
	}
	
	@Override
	public int insertPledges(Pledges pledges) throws Exception {
		int result = 0;
		try {
			result = sqlSession.insert("PledgesMapper.insert_pledges", pledges);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("저장된 후원 없음.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("후원 저장에 실패.");
		} finally {
			sqlSession.commit();
			
		}
		return result;
	}

}
