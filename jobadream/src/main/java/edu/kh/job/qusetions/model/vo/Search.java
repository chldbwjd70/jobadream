package edu.kh.job.qusetions.model.vo;

public class Search {
	private String sk;
	private String sv;

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

	@Override
	public String toString() {
		return "Search [sk=" + sk + ", sv=" + sv + "]";
	}
	
	
}
