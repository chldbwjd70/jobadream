package edu.kh.job.notice.model.service;

import java.util.List;

import edu.kh.job.notice.model.vo.Notice;
import edu.kh.job.notice.model.vo.Pagination;
import edu.kh.job.qusetions.model.vo.Search;

public interface NoticeService {

	/** 게시글수 조회
	 * @param pg
	 * @return pagination
	 */
	Pagination getPagination(Pagination pg);
	
	/** 게시글수 조회(검색)
	 * @param search
	 * @param pg
	 * @return pagination
	 */
	Pagination getPagination(Search search, Pagination pg);

	/** 게시글목록조회
	 * @param pagination
	 * @return noticeList
	 */
	List<Notice> selectNoticeList(Pagination pagination);
	
	/** 게시글 검색목록조회
	 * @param search
	 * @param pagination
	 * @return noticeList
	 */
	List<Notice> selectNoticeList(Search search, Pagination pagination);

	/** 게시글 상세조회
	 * @param noticeNo
	 * @return notice
	 */
	Notice selectNotice(int noticeNo);

	/** 게시글 삽입
	 * @param notice
	 * @return noticeNo
	 */
	int insertNotice(Notice notice);

	/** 수정화면
	 * @param noticeNo
	 * @return
	 */
	Notice selectUpdateNotice(int noticeNo);

	/** 게시글 수정
	 * @param notice
	 * @return result
	 */
	int updateNotice(Notice notice);

	int delete(int noticeNo);




	

}