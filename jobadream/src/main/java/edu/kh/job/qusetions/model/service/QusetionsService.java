package edu.kh.job.qusetions.model.service;

import java.util.List;

import edu.kh.job.qusetions.model.vo.Pagination;
import edu.kh.job.qusetions.model.vo.Qusetions;

public interface QusetionsService {

	/** 게시글수 조회
	 * @param pg
	 * @return pagination
	 */
	Pagination getPagination(Pagination pg);

	/** 게시글 목록조회
	 * @param pagination
	 * @return qusetionsList
	 */
	List<Qusetions> selectQusetionsList(Pagination pagination);

}
