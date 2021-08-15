package edu.kh.job.gps.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.job.board.model.vo.Board;

@Repository
public class GpsDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Board> selectList(String searchGu) {
		return sqlSession.selectList("gpsMapper.selectList", searchGu);
	}
}
