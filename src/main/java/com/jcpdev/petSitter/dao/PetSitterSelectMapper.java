package com.jcpdev.petSitter.dao;

import java.util.List;

import com.jcpdev.petSitter.model.AdopttimeDto;
import com.jcpdev.petSitter.model.AdopttimeDto_second;
import com.jcpdev.petSitter.model.PetsitterDto;

public interface PetSitterSelectMapper {
	int getCount_All(AdopttimeDto adopt);
	List<PetsitterDto> PetSitter_Select_All(AdopttimeDto_second adopt_second);
	int getCount_Adrr(AdopttimeDto adopt);
	List<PetsitterDto> PetSitter_Select_Addr(AdopttimeDto_second adopt_second);
	int getCount_Add_Date(AdopttimeDto adopt);
	
	List<PetsitterDto> PetSitter_Select_Addr_date(AdopttimeDto_second adopt_second);
	int getCount_Adrr_terms(AdopttimeDto adopt);
	List<PetsitterDto> select_Adrr_terms(AdopttimeDto_second adopt_second);
	
	int getCount_Add_Date_Terms(AdopttimeDto adopt);
	
	List<PetsitterDto> PetSitter_Select_Add_Date_Terms(AdopttimeDto_second adopt_second);
	int getCount_terms(AdopttimeDto adopt);
	List<PetsitterDto> PetSitter_Select_terms(AdopttimeDto_second adopt_second);
	
	int getCount_Date_terms(AdopttimeDto adopt);
	List<PetsitterDto> PetSitter_Select_Date_terms(AdopttimeDto_second adopt_second);
	
	int getCount_Date(AdopttimeDto adopt); 
	
	List<PetsitterDto> PetSitter_Select_Date(AdopttimeDto_second adopt_second);
}
