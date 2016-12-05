package team5.service;

import team5.model.Present;

public interface PresentService {
	/**
	 * 프로젝트 저장 후 보상품 저장 present insert
	 * @param present - 보상품 목록
	 * @throws Exception
	 * */
	public void insertPresent(Present present) throws Exception;
	
}
