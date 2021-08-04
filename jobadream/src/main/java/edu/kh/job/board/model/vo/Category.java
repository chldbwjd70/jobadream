package edu.kh.job.board.model.vo;

public class Category {
	private int categoryCode;
	private String categoryTitle;
	
	public Category() {
		// TODO Auto-generated constructor stub
	}

	
	
	public int getCategoryCode() {
		return categoryCode;
	}



	public void setCategoryCode(int categoryCode) {
		this.categoryCode = categoryCode;
	}


	public String getCategoryTitle() {
		return categoryTitle;
	}



	public void setCategoryTitle(String categoryTitle) {
		this.categoryTitle = categoryTitle;
	}



	@Override
	public String toString() {
		return "Category [categoryCode=" + categoryCode + ", categoryTitle=" + categoryTitle + "]";
	}

}
