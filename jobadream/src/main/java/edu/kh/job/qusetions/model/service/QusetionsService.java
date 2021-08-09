package edu.kh.job.qusetions.model.service;

import java.util.List;

import edu.kh.job.qusetions.model.vo.Pagination;
import edu.kh.job.qusetions.model.vo.Qusetions;
import edu.kh.job.qusetions.model.vo.Search;

public interface QusetionsService {

	/** 게시글수 조회
	 * @param pg
	 * @return pagination
	 */
	Pagination getPagination(Pagination pg);
	
	/** 전체게시글수(검색)
	 * @param search
	 * @param pg
	 * @return pagination
	 */
	Pagination getPagination(Search search, Pagination pg);

	/** 게시글 목록조회
	 * @param pagination
	 * @return qusetionsList
	 */
	List<Qusetions> selectQusetionsList(Pagination pagination);
	
	/** 게시글 목록조회(검색)
	 * @param search
	 * @param pagination
	 * @return qusetionsList
	 */
	List<Qusetions> selectQusetionsList(Search search, Pagination pagination);


	/** 게시글 상세조회
	 * @param qusetionsNo
	 * @return qusetions 
	 */
	Qusetions selectQusetions(int qusetionsNo);

	/** 게시글 삽입
	 * @param qusetions
	 * @return qusetionsNo
	 */
	int insertQu(Qusetions qusetions);


	/** 게시글 수정화면
	 * @param qusetionsNo
	 * @return qusetions
	 */
	Qusetions selectUpdateQusetions(int qusetionsNo);

	/** 게시글수정
	 * @param qusetions
	 * @return
	 */
	int updateQusetions(Qusetions qusetions);

	int deleteForm(int qusetionsNo);


}