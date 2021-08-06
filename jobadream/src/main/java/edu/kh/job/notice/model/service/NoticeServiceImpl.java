package edu.kh.job.notice.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.kh.job.notice.model.dao.NoticeDAO;
import edu.kh.job.notice.model.vo.Notice;
import edu.kh.job.notice.model.vo.Pagination;
import edu.kh.job.qusetions.model.vo.Search;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDAO dao;

	// 전체게시글수
	@Override
	public Pagination getPagination(Pagination pg) {

		// 전체게시글수 조회
		Pagination selectPg = dao.getListCount();
		return new Pagination(pg.getCurrentPage(), selectPg.getListCount());
	}
	
	
	// 검색한 게시글수
	@Override
	public Pagination getPagination(Search search, Pagination pg) {
		
		Pagination selectPg = dao.getSearchListCount(search);
		return new Pagination(pg.getCurrentPage(), selectPg.getListCount());
	}

	// 전체게시글 목록조회
	@Override
	public List<Notice> selectNoticeList(Pagination pagination) {
		return dao.selectNoticeList(pagination);
	}
	
	

	@Override
	public List<Notice> selectNoticeList(Search search, Pagination pagination) {
		return dao.selectSearchList(search,pagination);
	}


	// 게시글 상세조회
	@Transactional(rollbackFor = Exception.class)
	@Override
	public Notice selectNotice(int noticeNo) {
		Notice notice = dao.selectNotice(noticeNo);

		// System.out.println(notice);
		return notice;

	}

	// 게시글 삽입
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertNotice(Notice notice) {
		// 1) 크로스사이트 스크립트 방지 처리 + 개행문자 처리(\r\n -> <br>)
		notice.setNoticeTitle( replaceParameter(  notice.getNoticeTitle()  )  );
		notice.setNoticeContent( replaceParameter(  notice.getNoticeContent()  )  );
				
		notice.setNoticeContent(  notice.getNoticeContent().replaceAll("(\r\n|\r|\n|\n\r)", "<br>")  );
		
		int noticeNo = dao.insertNotice(notice);
		
		return noticeNo;
	}
	
	
	// 게시글 수정화면
	@Override
	public Notice selectUpdateForm(int noticeNo) {
		
		Notice notice = dao.selectNotice(noticeNo);
		System.out.println("왜안됨 : "+ notice);
		notice.setNoticeContent(notice.getNoticeContent().replaceAll("<br>", "\r\n"));
		return notice;
	}
	
	
	

	@Override
	public int delete(int noticeNo) {
		return dao.delete(noticeNo);
	}


		// 크로스 사이트 스크립트 방지 처리 메소드
		public static String replaceParameter(String param) {
			String result = param;
			if(param != null) {
				result = result.replaceAll("&", "&amp;");
				result = result.replaceAll("<", "&lt;");
				result = result.replaceAll(">", "&gt;");
				result = result.replaceAll("\"", "&quot;");
			}
			
			return result;
		}

	
}
