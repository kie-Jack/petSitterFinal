package com.jcpdev.petSitter.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class Q_Comment {
	private int qc_idx;
	private int q_idx;
	private int idx;
	private String qc_content;
	private String nick;
}
