package edu.kh.job.qusetions.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.kh.job.qusetions.model.dao.QusetionsDAO;
import edu.kh.job.qusetions.model.vo.Pagination;
import edu.kh.job.qusetions.model.vo.Qusetions;
import edu.kh.job.qusetions.model.vo.Search;

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
	
	
	// 게시글수조회(검색포함)
	@Override
	public Pagination getPagination(Search search, Pagination pg) {
		
		Pagination selectPg = dao.getSearchListCount(search);
		return new Pagination(pg.getCurrentPage(), selectPg.getListCount());
	}



	// 게시글 목록조회
	@Override
	public List<Qusetions> selectQusetionsList(Pagination pagination) {
		return dao.selectQusetionList(pagination);
	}

	
	// 검색한 게시글 목록조회
	@Override
	public List<Qusetions> selectQusetionsList(Search search, Pagination pagination) {
		return dao.selectSearchList(search ,pagination);
	}


	// 게시글 상세조회
	@Transactional(rollbackFor = Exception.class)
	@Override
	public Qusetions selectQusetions(int qusetionsNo) {
		
		return dao.selectQusetions(qusetionsNo);
	}

	// 게시글 삽입
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertQu(Qusetions qusetions) {
		
		// 크로스사이트스크립트방지+ 개행문자
		qusetions.setQusetionsTitle( replaceParameter(  qusetions.getQusetionsTitle()  )  );
		qusetions.setQusetionsContent( replaceParameter(  qusetions.getQusetionsContent()  )  );
				
		qusetions.setQusetionsContent(  qusetions.getQusetionsContent().replaceAll("(\r\n|\r|\n|\n\r)", "<br>")  );
		
		// 게시글삽입
		int qusetionsNo = dao.insertQu(qusetions);
		return qusetionsNo;
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