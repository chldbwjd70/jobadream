package edu.kh.job.gps.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.job.board.model.vo.Board;
import edu.kh.job.gps.model.dao.GpsDAO;

@Service
public class GpsServiceImpl implements GpsService{
	
	@Autowired
	private GpsDAO dao;

	
	@Override
	public List<Board> selectList(String searchGu) {
		return dao.selectList(searchGu);
	}
	
	

}
