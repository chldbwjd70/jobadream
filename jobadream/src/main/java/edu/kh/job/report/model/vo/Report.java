package edu.kh.job.report.model.vo;

import java.sql.Timestamp;
import java.util.List;

import edu.kh.job.member.model.vo.Member;

public class Report {
	
	private int reportNo;
	private String reportTitle;
	private String reportContent;
	private Timestamp reportDt;
	private String reportStatus;
	private String reportReplyStatus;
	private int memberNo;
	private int reportCategoryCd;
	
	private List<ReportFile> rfList;
	
	private Member mem; // join
	private ReportCategory rcategory; // join
	
	public Report() {
		// TODO Auto-generated constructor stub
	}

	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public String getReportTitle() {
		return reportTitle;
	}

	public void setReportTitle(String reportTitle) {
		this.reportTitle = reportTitle;
	}

	public String getReportContent() {
		return reportContent;
	}

	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}

	public Timestamp getReportDt() {
		return reportDt;
	}

	public void setReportDt(Timestamp reportDt) {
		this.reportDt = reportDt;
	}

	public String getReportStatus() {
		return reportStatus;
	}

	public void setReportStatus(String reportStatus) {
		this.reportStatus = reportStatus;
	}

	public String getReportReplyStatus() {
		return reportReplyStatus;
	}

	public void setReportReplyStatus(String reportReplyStatus) {
		this.reportReplyStatus = reportReplyStatus;
	}


	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getReportCategoryCd() {
		return reportCategoryCd;
	}

	public void setReportCategoryCd(int reportCategoryCd) {
		this.reportCategoryCd = reportCategoryCd;
	}

	public Member getMem() {
		return mem;
	}

	public void setMem(Member mem) {
		this.mem = mem;
	}

	public ReportCategory getRcategory() {
		return rcategory;
	}

	public void setRcategory(ReportCategory rcategory) {
		this.rcategory = rcategory;
	}
	
	

	public List<ReportFile> getRfList() {
		return rfList;
	}

	public void setRfList(List<ReportFile> rfList) {
		this.rfList = rfList;
	}

	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", reportTitle=" + reportTitle + ", reportContent=" + reportContent
				+ ", reportDt=" + reportDt + ", reportStatus=" + reportStatus + ", reportReplyStatus="
				+ reportReplyStatus + ", memberNo=" + memberNo + ", reportCategoryCd=" + reportCategoryCd + ", rfList="
				+ rfList + ", mem=" + mem + ", rcategory=" + rcategory + "]";
	}

	
	
	
	
	

}
