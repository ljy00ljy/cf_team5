package team5.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import team5.model.BbsComment;
import team5.service.BbsCommentService;

public class BbsCommentServiceImpl implements BbsCommentService {
	/** 처리 결과를 기록할 Log4J 객체 생성 */
	// --> import org.apache.logging.log4j.Logger;
	Logger logger;

	/** MyBatis */
	// --> import org.apache.ibatis.session.SqlSession
	SqlSession sqlSession;

	/** 생성자를 통한 객체 생성 */
	public BbsCommentServiceImpl(SqlSession sqlSession, Logger logger) {
		this.sqlSession = sqlSession;
		this.logger = logger;
	}

	@Override
	public void insertComment(BbsComment comment) throws Exception {
		try {
			int result = sqlSession.insert("BbsCommentMapper.insertComment", comment);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("저장된 덧글이 없습니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("덧글 등록에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
	}

	@Override
	public BbsComment selectComment(BbsComment comment) throws Exception {
		BbsComment result = null;

		try {
			result = sqlSession.selectOne("BbsCommentMapper.selectComment", comment);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("조회된 덧글이 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("덧글 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public List<BbsComment> selectCommentList(BbsComment comment) throws Exception {
		List<BbsComment> result = null;

		try {
			result = sqlSession.selectList("BbsCommentMapper.selectCommentList", comment);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("조회된 덧글이 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("덧글 목록 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int selectCommentCountByMemberId(BbsComment comment) throws Exception {
		int result = 0;

		try {
			// 자신의 덧글이 아닌 경우도 있으므로,
			// 결과값이 0인 경우에 대한 예외를 발생시키지 않는다.
			result = sqlSession.selectOne(
					"BbsCommentMapper.selectCommentCountByMemberId", comment);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("덧글 수 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int selectCommentCountByPw(BbsComment comment) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("BbsCommentMapper.selectCommentCountByPw", comment);
			// 비밀번호가 일치하는 데이터의 수가 0이라면 비밀번호가 잘못된 것으로 간주한다.
			if (result < 1) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("본인의 뎃글이 아닙니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("게시물 수 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public void deleteComment(BbsComment comment) throws Exception {
		try {
			int result = sqlSession.delete("BbsCommentMapper.deleteComment", comment);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("존재하지 않는 덧글에 대한 요청입니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("덧글 삭제에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
	}
	
	@Override
	public void updateComment(BbsComment comment) throws Exception {
		try {
			int result = sqlSession.update("BbsCommentMapper.updateComment", comment);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("존재하지 않는 덧글에 대한 요청입니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("덧글 수정에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
	}

	@Override
	public void deleteCommentAll(BbsComment comment) throws Exception {
		try {
			// 덧글이 존재하지 않는 게시물에 대한 요청일 수 있으므로,
			// NullPointerException을 발생시키지 않는다.
			sqlSession.delete("BbsCommentMapper.deleteCommentAll", comment);
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("덧글 삭제에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
	}

	@Override
	public void updateCommentMemberOut(BbsComment comment) throws Exception {
		try {
			// 덧글을 작성한 적이 없는 회원도 있을 수 있기 때문에,
			// NullPointerException을 발생시키지 않는다.
			sqlSession.update("BbsCommentMapper.updateCommentMemberOut", comment);
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("참조관계 해제에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
	}

}
