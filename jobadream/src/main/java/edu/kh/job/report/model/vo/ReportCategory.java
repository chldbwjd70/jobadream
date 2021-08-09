package edu.kh.job.report.model.vo;

public class ReportCategory {
	
	private int reportCategoryCd;
	private String reportCategoryTitle;
	
	public ReportCategory() {
		// TODO Auto-generated constructor stub
	}

	public int getReportCategoryCd() {
		return reportCategoryCd;
	}

	public void setReportCategoryCd(int reportCategoryCd) {
		this.reportCategoryCd = reportCategoryCd;
	}

	public String getReportCategoryTitle() {
		return reportCategoryTitle;
	}

	public void setReportCategoryTitle(String reportCategoryTitle) {
		this.reportCategoryTitle = reportCategoryTitle;
	}

	@Override
	public String toString() {
		return "ReportCategory [reportCategoryCd=" + reportCategoryCd + ", reportCategoryTitle=" + reportCategoryTitle
				+ "]";
	}

	

}
