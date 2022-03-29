package com.jcpdev.petSitter.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Member {
	private int idx;
	private int admin;
	private String name;
	private String id;
	private String password;
	private String nick;
	private String gender;
	private String birth;
	private String tel;
	private String m_addr;
	private String s_addr;
	private int point;
	private String p_auth;
	private String license;
	private int work_date;
	private String home;
	private String to;
}
