package edu.kh.job.member.model.vo;

public class Pagination3 {

	private int currentPage;		// 목록상 현재 페이지 
	private int listCount;			// 게시글 전체 수
	
	private int limit = 5;			// 한 페이지에 보여질 게시글 수
	private int pageSize = 5; 		// 보여질 페이지 번호 개수
	
	private int maxPage;			// 게시글 목록의 마지막 페이지 번호
	private int startPage;			// 보여지는 페이지 번호 중 시작 번호
	private int endPage;			// 보여지는 페이지 번호 중 끝 번호
	
	private int prevPage;			// 이전 페이지 번호 목록 중 끝 번호
	private int nextPage;			// 다음 페이지 번호 목록 중 시작 번호
	
	private int categoryCode;			// 카테고리 타입 번호
	private String categoryTitle;		// 카테고리 이름
	
	public Pagination3() {
		// TODO Auto-generated constructor stub
	}
	
	
	public Pagination3(int currentPage, int listCount) {
		super();
		this.currentPage = currentPage;
		this.listCount = listCount;
		
		makePagination();
	}

	public Pagination3(int currentPage, int listCount, int categoryCode, String categoryTitle) {
		this.currentPage = currentPage;
		this.listCount = listCount;
		this.categoryCode = categoryCode;
		this.categoryTitle = categoryTitle;
		
		makePagination();
	}



	public int getCurrentPage() {
		return currentPage;
	}



	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
		
		makePagination();
	}



	public int getListCount() {
		return listCount;
	}



	public void setListCount(int listCount) {
		this.listCount = listCount;
		
		makePagination();
	}


	public int getLimit() {
		return limit;
	}


	public void setLimit(int limit) {
		this.limit = limit;
		
		makePagination();
	}


	public int getPageSize() {
		return pageSize;
	}



	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
		
		makePagination();
	}



	public int getMaxPage() {
		return maxPage;
	}



	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}



	public int getStartPage() {
		return startPage;
	}



	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}



	public int getEndPage() {
		return endPage;
	}



	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}



	public int getPrevPage() {
		return prevPage;
	}



	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}



	public int getNextPage() {
		return nextPage;
	}



	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
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
		return "Pagination [currentPage=" + currentPage + ", listCount=" + listCount + ", limit=" + limit
				+ ", pageSize=" + pageSize + ", maxPage=" + maxPage + ", startPage=" + startPage + ", endPage="
				+ endPage + ", prevPage=" + prevPage + ", nextPage=" + nextPage + ", categoryCode=" + categoryCode
				+ ", categoryTitle=" + categoryTitle + "]";
	}


	// 페이징 처리에 필요한 값을 계산하는 메소드
	private void makePagination() {
		
		// maxPage == 마지막 페이지 == 총 페이지 수
		maxPage = (int)Math.ceil(   (double)listCount / limit   );
		
		// startPage == 페이지 번호 목록 시작 번호
		startPage = (currentPage - 1 ) / pageSize * pageSize + 1;
		
		// endPage == 페이지 번호 목록 끝 번호
		endPage = startPage + pageSize - 1;
		
		// ** 보여지는 페이지 번호 목록의 끝 번호가 maxPage보다 클 경우
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		// 이전, 다음 페이지 번호 목록으로 이동
		if(currentPage < 10) 	prevPage = 1;
		else					prevPage = (currentPage - 1 ) / pageSize * pageSize ;
		
		
		nextPage = (currentPage + pageSize - 1) / pageSize * pageSize + 1;
		
		if(nextPage > maxPage) {
			nextPage = maxPage;
		}
		
	}
	
	
}
