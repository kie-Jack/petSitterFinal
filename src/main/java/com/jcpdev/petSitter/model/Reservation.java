package com.jcpdev.petSitter.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Reservation {
	private int r_idx;
	private int idx;
	private int ps_idx;
	private int pay;
	private Date s_date;
	private Date f_date;
	private Date r_date;
	private Date p_date;
}
