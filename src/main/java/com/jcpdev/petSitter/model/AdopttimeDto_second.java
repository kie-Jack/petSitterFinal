package com.jcpdev.petSitter.model;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AdopttimeDto_second {
	private String m_addr;
	private String wdate_start;
	private String wdate_final;
	private String terms;
	private int pageSize;
	private int StartNo;
	private String findText;
	private String field;
	
}
