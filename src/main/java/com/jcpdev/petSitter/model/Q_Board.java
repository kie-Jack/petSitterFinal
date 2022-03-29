package com.jcpdev.petSitter.model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
@Getter
@Setter
public class Q_Board {
	private int q_idx;
	private int idx;
	private String nick;
	private String password;
	private String title;
	private String content;
	private int q_cnt;
	private Timestamp q_date;				//Date 타입은 날짜만 가져오고 시간을 못가져옵니다.
	private String ip;
	private int qc_cnt;
	}
