package com.jcpdev.petSitter.dao;

import com.jcpdev.petSitter.model.PetProfile;

public interface PetProfileMapper {
	
	int insert(PetProfile pet);
	int p_check(PetProfile pet);
}
