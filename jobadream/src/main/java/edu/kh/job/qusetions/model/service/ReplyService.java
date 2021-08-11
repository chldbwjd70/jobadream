package edu.kh.job.qusetions.model.service;

import java.util.List;

import edu.kh.job.qusetions.model.vo.Reply;

public interface ReplyService {

	/** 댓글목록조회
	 * @param qusetionsNo
	 * @return rList
	 */
	List<Reply> selectList(int qusetionsNo);

	

}