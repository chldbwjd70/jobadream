package edu.kh.job.notice.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.job.notice.model.dao.NoticeDAO;
import edu.kh.job.notice.model.vo.Notice;
import edu.kh.job.notice.model.vo.Pagination;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeDAO dao;

	// 전체게시글수
	@Override
	public Pagination getPagination(Pagination pg) {
		
		// 전체게시글수 조회
		Pagination selectPg = dao.getListCount();
		return new Pagination(pg.getCurrentPage(), selectPg.getListCount());
	}

	//전체게시글 목록조회
	@Override
	public List<Notice> selectNoticeList(Pagination pagination) {
		return dao.selectNoticeList(pagination);
	}
	
	
	
	
	
	

}
