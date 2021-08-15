package edu.kh.job.member.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.job.chat.model.vo.ChatAlarm;
import edu.kh.job.member.model.vo.Board;
import edu.kh.job.member.model.vo.Import;
import edu.kh.job.member.model.vo.Member;
import edu.kh.job.member.model.vo.Pagination;
import edu.kh.job.member.model.vo.Pagination2;
import edu.kh.job.member.model.vo.Pagination3;
import edu.kh.job.member.model.vo.Progress;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 로그인
	public Member login(String memberId) {
		return sqlSession.selectOne("memberMapper.login", memberId);
	}

	// 회원 가입
	public int signUp(Member inputMember) {
		return sqlSession.insert("memberMapper.signUp", inputMember);
	}

	// 아이디 중복 검사
	public int idDupCheck(String id) {
		return sqlSession.selectOne("memberMapper.idDupCheck", id);
	}

	// 회원 정보 수정
	public int updateMember(Member inputMember) {
		return sqlSession.update("memberMapper.updateMember", inputMember);
	}

	// 회원 비밀번호 조회
	public String selectPassword(int memberNo) {
		return sqlSession.selectOne("memberMapper.selectPassword", memberNo);
	}

	// 회원 비밀번호 수정
	public int changPwd(Member loginMember) {
		return sqlSession.update("memberMapper.changPwd", loginMember);
	}

	// 회원 탈퇴
	public int secession(int memberNo) {
		return sqlSession.update("memberMapper.secession", memberNo);
	}

	// 아이디 찾기
	public String findId(Member findMemberId) {
		return sqlSession.selectOne("memberMapper.findId", findMemberId);
	}

	// 비밀번호 찾기 - 조회
	public int findPw(Member findMemberPw) {
		return sqlSession.selectOne("memberMapper.findPw", findMemberPw);
	}

	// 임시 비밀번호로 회원 정보 변경
	public int changePwd2(Member findMemberPw) {
		return sqlSession.update("memberMapper.changePwd2", findMemberPw);
	}

	// 알람 리스트 조회
	public List<ChatAlarm> selectAlarm(int memberNo) {
		return sqlSession.selectList("memberMapper.selectAlarm", memberNo);
	}

	// 아줌게시글수
	public Pagination getajumListCount(int memberNo) {
		return sqlSession.selectOne("memberMapper.getajumListCount", memberNo);
	}

	// 아줌게시글목록
	public List<Board> selectajumList(Pagination pagination, int memberNo, int memberNo2) {
		// RowBounds사용
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		RowBounds rowBouns = new RowBounds(offset, pagination.getLimit());
		return sqlSession.selectList("memberMapper.selectajumList", memberNo, rowBouns);
	}

	// 아감 게시글수
	public Pagination2 getagamListCount(int memberNo) {
		return sqlSession.selectOne("memberMapper.getagamListCount", memberNo);
	}

	// 아감 게시글목록
	public List<Board> selectagamList(Pagination2 pagination2, int memberNo, int memberNo2) {
		// RowBounds사용
		int offset = (pagination2.getCurrentPage() - 1) * pagination2.getLimit();
		RowBounds rowBouns = new RowBounds(offset, pagination2.getLimit());
		return sqlSession.selectList("memberMapper.selectagamList", memberNo, rowBouns);
	}

	// 진행완료 버튼
	public int avgPoint(Progress progress) {
		return sqlSession.update("memberMapper.avgPoint", progress);
	}

	// 포인트 차감
	public int updatePoint(Member countMember, int teste) {
		return sqlSession.update("memberMapper.updatePoint", countMember);
	}

	// 조회
	public Member changPoint(int memberNo) {
		return sqlSession.selectOne("memberMapper.changPoint", memberNo);
	}

	// 포인트 추가
	public int plusPoint(Member changePoint) {
		return sqlSession.update("memberMapper.plusPoint", changePoint);
	}

	// 결제 내역 수
	public Pagination3 getpointListCount(int memberNo) {
		return sqlSession.selectOne("memberMapper.getpointListCount", memberNo);
	}

	// 결제 내역 목록 조회
	public List<Import> sellHistory(Pagination3 pagination3, int memberNo) {
		// RowBounds사용
		int offset = (pagination3.getCurrentPage() - 1) * pagination3.getLimit();
		RowBounds rowBouns = new RowBounds(offset, pagination3.getLimit());
		return sqlSession.selectList("memberMapper.sellHistory", memberNo, rowBouns);
	}

	// 포인트 충전 --1
	public int pointUpdate(Import pointMember) {
		return sqlSession.insert("memberMapper.pointUpdate", pointMember);
	}

	// 포인트 충전 -2
	public int pointadd(Member addPoint) {
		return sqlSession.update("memberMapper.pointadd", addPoint);
	}

	// 추가
	public Member plusPoint(int memberNo) {
		return sqlSession.selectOne("memberMapper.changPoint", memberNo);
	}

	// 평균
	public Progress scoreMember(int memberNo) {
		System.out.println("memberNod : " + memberNo);
		
		return sqlSession.selectOne("memberMapper.scoreMember", memberNo);
	}

	// 인원수
	public Progress countMember(int memberNo) {
		return sqlSession.selectOne("memberMapper.countMember", memberNo);
	}

}
