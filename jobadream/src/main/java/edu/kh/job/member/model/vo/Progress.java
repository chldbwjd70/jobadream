package edu.kh.job.member.model.vo;

public class Progress {
	
	private int memberNo;
	private int boardNo;
	private String progressStatus;
	private int memberScore;
	
	private double pointAVG;
	
	private int countMember;
	
	public Progress() {}

	public double getPointAVG() {
		return pointAVG;
	}
	public void setPointAVG(double pointAVG) {
		this.pointAVG = pointAVG;
	}
	
	public int getCountMember() {
		return countMember;
	}
	public void setCountMember(int countMember) {
		this.countMember = countMember;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getProgressStatus() {
		return progressStatus;
	}

	public void setProgressStatus(String progressStatus) {
		this.progressStatus = progressStatus;
	}

	public int getMemberScore() {
		return memberScore;
	}

	public void setMemberScore(int memberScore) {
		this.memberScore = memberScore;
	}

	@Override
	public String toString() {
		return "Progress [memberNo=" + memberNo + ", boardNo=" + boardNo + ", progressStatus=" + progressStatus
				+ ", memberScore=" + memberScore + ", pointAVG=" + pointAVG + ", countMember=" + countMember + "]";
	}
	
}
