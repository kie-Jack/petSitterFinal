package com.jcpdev.petSitter.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Pet {
	private int idx;			// 회원번호
	private String pet;			// 견종
	private String p_name;		// 펫 이름
	private String p_gender;	// 펫 성별
	private double p_weight;	// 펫 몸무게
	private String p_birth;		// 펫 생년월일
	private String p_neu;		// 펫 중성화 여부
}
