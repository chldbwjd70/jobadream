package edu.kh.job.notice.model.service;

import java.util.List;

import edu.kh.job.notice.model.vo.Notice;
import edu.kh.job.notice.model.vo.Pagination;

public interface NoticeService {

	/** 게시글목록 페이지네이션
	 * @param pg
	 * @return pagination
	 */
	Pagination getPagination(Pagination pg);

	/** 게시글목록조회
	 * @param pagination
	 * @return noticeList
	 */
	List<Notice> selectNoticeList(Pagination pagination);

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

	/** 게시글 수정
	 * @param noticeNo
	 * @return notice
	 */
	Notice selectUpdateNotice(int noticeNo);

}