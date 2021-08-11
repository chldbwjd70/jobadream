package edu.kh.job.qusetions.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.job.qusetions.model.dao.ReplyDAO;
import edu.kh.job.qusetions.model.vo.Reply;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyDAO dao;
	
	
	

	// 댓글목록조회
	@Override
	public List<Reply> selectList(int qusetionsNo) {
		return dao.selectList(qusetionsNo);
	}



}