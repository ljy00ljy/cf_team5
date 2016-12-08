package team5.service;

import team5.model.Pledges;

public interface PledgesService {
	/**
	 * pledge insert 투자 저장
	 * @param - pledges
	 * @throws Exception
	 */
	public int insertPledges(Pledges pledges) throws Exception;
}
