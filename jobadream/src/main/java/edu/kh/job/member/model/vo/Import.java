package edu.kh.job.member.model.vo;

import java.sql.Timestamp;

public class Import {
	
	private int importNo;
	private int importMoney;
	private int memberNo;
	private Timestamp importDt;
	
	public Import() {}

	public int getImportNo() {
		return importNo;
	}
	public void setImportNo(int importNo) {
		this.importNo = importNo;
	}

	public int getImportMoney() {
		return importMoney;
	}
	public void setImportMoney(int importMoney) {
		this.importMoney = importMoney;
	}

	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public Timestamp getImportDt() {
		return importDt;
	}
	public void setImportDt(Timestamp importDt) {
		this.importDt = importDt;
	}

	@Override
	public String toString() {
		return "Import [importNo=" + importNo + ", importMoney=" + importMoney + ", memberNo=" + memberNo
				+ ", importDt=" + importDt + "]";
	}
}
