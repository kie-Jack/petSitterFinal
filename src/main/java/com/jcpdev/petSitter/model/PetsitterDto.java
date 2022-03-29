package com.jcpdev.petSitter.model;


import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PetsitterDto {
	private int psb_idx;
	private int idx;
	private String title;
	private String content;
	private Date ps_sdate;
	private Date ps_fdate;
	private String p_size;
	private String comment;
	private String terms;
	private String g_fname;	
	private String m_addr;
	private String name;
}
