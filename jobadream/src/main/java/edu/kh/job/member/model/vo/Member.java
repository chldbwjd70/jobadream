package edu.kh.job.member.model.vo;

import java.sql.Date;

public class Member {
	private int memberNo;			// 회원 번호
	private String memberId;		// 회원 아이디
	private String memberPw;		// 회원 비밀번호
	private String memberName;		// 회원 이름
	private String memberPhone;		// 전화번포('-' 포함)
	private String memberEmail;		// 이메일
	private String memberAddress;	// 주소 
	private Date enrollDate;		// 가입일
	private String memberStatus;	// 회원 상태(Y:정상, N:탈퇴)
	private String memberGrade;		// 회원 등급(A:관리자, G:일반)
	private int memberPoint; 		// 회원 포인트
	private String memberIntroduce; // 회원 소개
	
	private int boardNo;
	
	private int inputPoint;
	
	private int memberscore;
	
	
	public Member() { }
	
	public int getMemberscore() {
		return memberscore;
	}
	public void setMemberscore(int memberscore) {
		this.memberscore = memberscore;
	}

	public int getInputPoint() {
		return inputPoint;
	}
	public void setInputPoint(int inputPoint) {
		this.inputPoint = inputPoint;
	}

	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}


	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPw() {
		return memberPw;
	}
	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}

	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberPhone() {
		return memberPhone;
	}
	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberAddress() {
		return memberAddress;
	}
	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getMemberStatus() {
		return memberStatus;
	}
	public void setMemberStatus(String memberStatus) {
		this.memberStatus = memberStatus;
	}

	public String getMemberGrade() {
		return memberGrade;
	}
	public void setMemberGrade(String memberGrade) {
		this.memberGrade = memberGrade;
	}

	public int getMemberPoint() {
		return memberPoint;
	}
	public void setMemberPoint(int memberPoint) {
		this.memberPoint = memberPoint;
	}

	public String getMemberIntroduce() {
		return memberIntroduce;
	}
	public void setMemberIntroduce(String memberIntroduce) {
		this.memberIntroduce = memberIntroduce;
	}


	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberId=" + memberId + ", memberPw=" + memberPw + ", memberName="
				+ memberName + ", memberPhone=" + memberPhone + ", memberEmail=" + memberEmail + ", memberAddress="
				+ memberAddress + ", enrollDate=" + enrollDate + ", memberStatus=" + memberStatus + ", memberGrade="
				+ memberGrade + ", memberPoint=" + memberPoint + ", memberIntroduce=" + memberIntroduce + ", boardNo="
				+ boardNo + "]";
	}


}
