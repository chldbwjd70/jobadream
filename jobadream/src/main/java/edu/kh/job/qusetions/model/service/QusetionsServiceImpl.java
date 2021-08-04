package edu.kh.job.qusetions.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.job.qusetions.model.dao.QusetionsDAO;
import edu.kh.job.qusetions.model.vo.Pagination;
import edu.kh.job.qusetions.model.vo.Qusetions;

@Service
public class QusetionsServiceImpl implements QusetionsService{
	
	@Autowired
	private QusetionsDAO dao;

	// 게시글 수 조회
	@Override
	public Pagination getPagination(Pagination pg) {
		
		Pagination selectPg = dao.getListCount();
		return new Pagination(pg.getCurrentPage(), selectPg.getListCount());
	}

	// 게시글 목록조회
	@Override
	public List<Qusetions> selectQusetionsList(Pagination pagination) {
		return dao.selectQusetionList(pagination);
	}
	
	
	
	
	

}