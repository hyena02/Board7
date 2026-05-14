package com.green.paging.dto;

import lombok.Getter;
import lombok.ToString;
//		 limitStart					numOfRows
//OFFSET 	 30		ROWS FETCH NEXT 	10 		ROWS ONLY;
//paging.jsp  : 페이지 번호를 출력할 파일 srchDto
//		 startPage	nowpage(pageNo)	 endPage
//<< | < |	1  		2  3 .... 		9 10 | > | >>
//<< | < |  11 		12 13....   	  20 | > | >>	
//								totalPageCount : 전체 페이지수
@Getter
@ToString
public class Pagination {
	private int totalCount; 	// 해당 메뉴의 조회된 자료수
	private int totalPage;		// 전체 페이지수 : totalCount/numOfRows
	private int totalPageCount;	// 전체 페이지 개수
	
	private int startPage;		// 화면에 보여줄 첫 페이지 번호
	private int endPage;		// 화면에 보여줄 마지막 페이지 번호
	
	private int limitStart;		//DB 에서 몇 번째부터 가져올지
	
	private boolean existPrevPage;	// 이전 버튼 여부
	private boolean existNextPage;	// 다음 버튼 여부
	
	//생성자
	public Pagination( int totalCount, SearchDto srchDto ) {
		if( totalCount > 0 ) {
			this.totalCount = totalCount;
			calculation(srchDto);
		}
		
	}

	private void calculation(SearchDto srchDto) {
		//전체 페이지수 계산
		int numOfRows = srchDto.getNumOfRows();
		this.totalPageCount = (int)Math.ceil((double) this.totalCount/(double)numOfRows);
		
		// 현재 페이지 : pageNo <- nowpage
		int pageNo = srchDto.getPageNo();
		if( pageNo > this.totalPageCount) {
			
			pageNo = this.totalPageCount;
			srchDto.setPageNo(pageNo);
		}
		// 페이지 번호의 시작 계산
		int pageSize = srchDto.getPageSize(); // 한줄에 출력할 페이지 번호 수
		startPage = ((pageNo - 1 ) / pageSize) * pageSize + 1;
		endPage = startPage + pageSize - 1;
		
		//limitStart : 데이터베이스 가져올 시작 위치
		limitStart = srchDto.getOffset();
		// == limitStart = (pageNo - 1) * numOfRows;     -> 공식	ex) pageNo = 1 이면 (1-1)*10 = 0 [0번째부터 10개 -> 1~10]
		
		
		//이전 페이지로 이동 버튼 
		existPrevPage = startPage > 1;
		
		// 다음페이지로 이동 버튼 필요
		existNextPage = endPage < totalPageCount;
		
		
	}
}
