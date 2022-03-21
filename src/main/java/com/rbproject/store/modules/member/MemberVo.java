package com.rbproject.store.modules.member;

import java.util.Date;

public class MemberVo {
	
	private String ifmmSeq = "";
		
	private String shValue;
	private String shOption;
	
//	paging
	private Integer thisPage = 1;									// 현재 페이지
	private Integer rowNumToShow = 5;								// 화면에 보여줄 데이터 줄 갯수
	private Integer pageNumToShow = 5;								// 화면에 보여줄 페이징 번호 갯수

	private Integer totalRows;										// 전체 데이터 갯수
	private Integer totalPages;										// 전체 페이지 번호
	private Integer startPage;										// 시작 페이지 번호
	private Integer endPage;										// 마지막 페이지 번호
	
	private Integer startRnumForOracle = 1;							// 쿼리 시작 row
	private Integer endRnumForOracle;								// 쿼리 끝 row
	private Integer RNUM;
	
	private Integer startRnumForMysql = 0;							// 쿼리 시작 row
	
//	------------------------------
	
	public void setParamsPaging(int totalRowsParam) {
		
		totalRows = totalRowsParam;

		totalPages = totalRows / rowNumToShow;

		if (totalRows % rowNumToShow > 0) {
			totalPages = totalPages+ 1;
		}

		if (totalPages < thisPage) {
			thisPage = totalPages;
		}
		
		startPage = (((thisPage - 1) / pageNumToShow) * pageNumToShow + 1);

		endPage = (startPage + pageNumToShow - 1);

		if (endPage > totalPages) {
			endPage = (totalPages);
		}
		
		endRnumForOracle = ((rowNumToShow * thisPage));
		startRnumForOracle = ((endRnumForOracle - rowNumToShow) + 1);
		if (startRnumForOracle < 1) startRnumForOracle = 1;
		
		
		if (thisPage == 1) {
			startRnumForMysql = 0;
		} else {
			startRnumForMysql = ((rowNumToShow * (thisPage-1)));
		}
		
		System.out.println("getThisPage():" + thisPage);
		System.out.println("getTotalRows():" + totalRows);
		System.out.println("getRowNumToShow():" + rowNumToShow);
		System.out.println("getTotalPages():" + totalPages);
		System.out.println("getStartPage():" + startPage);
		System.out.println("getEndPage():" + endPage);		
		System.out.println("getStartRnumForOracle():" + startRnumForOracle);
		System.out.println("getEndRnumForOracle():" + endRnumForOracle);
		System.out.println("getStartRnumForMysql(): " + startRnumForMysql);
		
	}
	
//------------
	public String getIfmmSeq() {
		return ifmmSeq;
	}
	public void setIfmmSeq(String ifmmSeq) {
		this.ifmmSeq = ifmmSeq;
	}
	public String getShValue() {
		return shValue;
	}
	public void setShValue(String shValue) {
		this.shValue = shValue;
	}
	public String getShOption() {
		return shOption;
	}
	public void setShOption(String shOption) {
		this.shOption = shOption;
	}

	public Integer getThisPage() {
		return thisPage;
	}

	public void setThisPage(Integer thisPage) {
		this.thisPage = thisPage;
	}

	public Integer getRowNumToShow() {
		return rowNumToShow;
	}

	public void setRowNumToShow(Integer rowNumToShow) {
		this.rowNumToShow = rowNumToShow;
	}

	public Integer getPageNumToShow() {
		return pageNumToShow;
	}

	public void setPageNumToShow(Integer pageNumToShow) {
		this.pageNumToShow = pageNumToShow;
	}

	public Integer getTotalRows() {
		return totalRows;
	}

	public void setTotalRows(Integer totalRows) {
		this.totalRows = totalRows;
	}

	public Integer getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(Integer totalPages) {
		this.totalPages = totalPages;
	}

	public Integer getStartPage() {
		return startPage;
	}

	public void setStartPage(Integer startPage) {
		this.startPage = startPage;
	}

	public Integer getEndPage() {
		return endPage;
	}

	public void setEndPage(Integer endPage) {
		this.endPage = endPage;
	}

	public Integer getStartRnumForOracle() {
		return startRnumForOracle;
	}

	public void setStartRnumForOracle(Integer startRnumForOracle) {
		this.startRnumForOracle = startRnumForOracle;
	}

	public Integer getEndRnumForOracle() {
		return endRnumForOracle;
	}

	public void setEndRnumForOracle(Integer endRnumForOracle) {
		this.endRnumForOracle = endRnumForOracle;
	}

	public Integer getRNUM() {
		return RNUM;
	}

	public void setRNUM(Integer rNUM) {
		RNUM = rNUM;
	}

	public Integer getStartRnumForMysql() {
		return startRnumForMysql;
	}

	public void setStartRnumForMysql(Integer startRnumForMysql) {
		this.startRnumForMysql = startRnumForMysql;
	}
	
}
