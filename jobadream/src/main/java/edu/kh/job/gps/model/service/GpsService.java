package edu.kh.job.gps.model.service;

import java.util.List;

import edu.kh.job.board.model.vo.Board;

public interface GpsService {

	List<Board> selectList(String searchGu);
	
	

}
