package com.jcpdev.petSitter.model;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Ps_board {
	private Integer psb_idx;
	private Integer idx;
	private String title;
	private String content;
	private Date ps_sdate;
	private Date ps_fdate;
	private String p_size;
	private String comment;
	private String terms;
	private String g_fname;
	private String m_addr;
	
	private List<MultipartFile> files;

}
