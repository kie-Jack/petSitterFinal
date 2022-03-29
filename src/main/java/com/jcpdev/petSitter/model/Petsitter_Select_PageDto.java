package com.jcpdev.petSitter.model;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@ToString
@NoArgsConstructor
@Data
public class Petsitter_Select_PageDto {
	private int currentPage;	//현재페이지
	private int totalCount;		//글의 전체갯수
	private int pageSize;		//한개페이지에 보여줄 글 갯수
	
	private int totalPage;	//전체 페이지수
	private int startPage;	
	private int endPage;
	
	private int StartNo;
	private String m_addr;
	private String wdate_start;
	private String wdate_final;
	private String terms;
	
	//조회후 검색
	private String findText;
	private String field;
	
	//생성자
	public Petsitter_Select_PageDto(int currentPage,int totalCount,int pageSize,String m_addr,String wdate_start,String wdate_final,String terms,String findText,String field) {
		super();
		this.currentPage=currentPage;
		this.totalCount=totalCount;
		this.pageSize = pageSize;
		this.m_addr = m_addr;
		this.wdate_start = wdate_start;
		this.wdate_final = wdate_final;
		this.terms = terms;
		this.findText = findText;
		this.field = field;
		
		totalPage = (totalCount-1)/pageSize +1; //ex) (81-1)/(10+1)=8 > 정수/정수=정수
		
		//현재페이지가 계산한 토탈페이지보다 크거나 1보다 작으면 무조건 1이고 아니면 가져온 현재페이지로 진행
		this.currentPage = (currentPage>totalPage || currentPage < 1)? 1:currentPage; 
		StartNo = (currentPage-1) * pageSize;
		
		//startPage, endPage 의 수식은 나중에 추가
		startPage = (this.currentPage - 1) / 3 * 3 + 1;   //currentPage 14일때 , 11 
		endPage = startPage + pageSize-1;							//currentPage 14일때 , 20
		endPage = endPage > totalPage ? totalPage : endPage;   //마지막 페이지목록에서 필요함.
		
		this.field = field;
		this.findText = findText;
		
	}

	
}
