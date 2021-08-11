package edu.kh.job.report.model.vo;

import java.util.Arrays;

public class Search {
	private String sk;
	private String sv;
	private int[] ct;

	public Search() {
		// TODO Auto-generated constructor stub
	}
	
	

	public String getSk() {
		return sk;
	}



	public void setSk(String sk) {
		this.sk = sk;
	}



	public String getSv() {
		return sv;
	}



	public void setSv(String sv) {
		this.sv = sv;
	}



	public int[] getCt() {
		return ct;
	}



	public void setCt(int[] ct) {
		this.ct = ct;
	}



	@Override
	public String toString() {
		return "Search [sk=" + sk + ", sv=" + sv + ", ct=" + Arrays.toString(ct) + "]";
	}
	
	


	
}
