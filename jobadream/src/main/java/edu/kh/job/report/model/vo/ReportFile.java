package edu.kh.job.report.model.vo;

public class ReportFile {
	
	private int fileNo;
	private String filePath;
	private String fileName;
	private int fileLevel;
	private int reportNo;
	
	public ReportFile() {
		// TODO Auto-generated constructor stub
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public int getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}

	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	@Override
	public String toString() {
		return "ReportFile [fileNo=" + fileNo + ", filePath=" + filePath + ", fileName=" + fileName + ", fileLevel="
				+ fileLevel + ", reportNo=" + reportNo + "]";
	}
	
	
	

}
