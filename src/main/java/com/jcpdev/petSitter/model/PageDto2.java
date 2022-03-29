package com.jcpdev.petSitter.model;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Data

public class PageDto2 {
	
	private int currentPage;		//현재 페이지
	private int pageSize;			//한개페이지에 보여줄 글 갯수
	private int totalCount;			//글의 전체 갯수
	
	private int startNo;
	private int startPage;
	private int totalPage;			
	private int endPage;			
	
	private String field;
	private String findText;
	
	private String nick;
	
	public PageDto2(int currentPage, int totalCount, int pageSize, String field, String findText) {   //외부(비지니스로직)에서 결정하고 전달되는값.
		super();
		this.currentPage=currentPage;
		this.pageSize = pageSize;
		this.totalCount=totalCount;
		totalPage = (totalCount-1)/pageSize + 1;
		
		this.currentPage = (currentPage>totalPage || currentPage < 1)? 1:currentPage; 
		startNo = (currentPage-1) * pageSize;
		
		//startPage, endPage 의 수식은 나중에 추가
		startPage = (this.currentPage - 1) / 10 * 10 + 1;   //currentPage 14일때 , 11 
		endPage = startPage + pageSize-1;							//currentPage 14일때 , 20
		endPage = endPage > totalPage ? totalPage : endPage;
		
		this.field = field;
		this.findText = findText;
	}
	

	public PageDto2(int currentPage, int totalCount, int pageSize, String nick){
		super();
		this.currentPage=currentPage;
		this.pageSize = pageSize;
		this.totalCount=totalCount;
	
		
		totalPage = (totalCount-1)/pageSize + 1;
		
		this.currentPage = (currentPage>totalPage || currentPage < 1)? 1:currentPage; 
		startNo = (currentPage-1) * pageSize;
		
		//startPage, endPage 의 수식은 나중에 추가
		startPage = (this.currentPage - 1) / 10 * 10 + 1;   //currentPage 14일때 , 11 
		endPage = startPage + pageSize-1;							//currentPage 14일때 , 20
		endPage = endPage > totalPage ? totalPage : endPage;

		this.nick=nick;
	}
}