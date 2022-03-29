package com.jcpdev.petSitter.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PetProfile {
	private int idx;
	private String pet;
	private String p_name;
	private String p_gender;
	private double p_weight;
	private String p_birth;
	private String p_neu;
	
	
}
