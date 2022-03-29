package com.jcpdev.petSitter.service;



import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jcpdev.petSitter.dao.PetSitterSelectMapper;
import com.jcpdev.petSitter.model.AdopttimeDto;
import com.jcpdev.petSitter.model.AdopttimeDto_second;
import com.jcpdev.petSitter.model.PetsitterDto;

@Service
public class PetSitterSelectServiceImpl implements PetSitterSelectService {
	private static final Logger logger = LoggerFactory.getLogger(PetSitterSelectServiceImpl.class);
	
	@Autowired
	PetSitterSelectMapper dao;
	
	@Override
	public int getCount_All(AdopttimeDto adopt) {
		//paging에 검색을 위한 필드와 검색어 속성 포함
		logger.info("아무것도 조회 안했을때 조회된 갯수");
		return dao.getCount_All(adopt);
	}
	
	@Override
	public List<PetsitterDto> PetSitter_Select_All(AdopttimeDto_second adopt_second) {
		//paging에 검색을 위한 필드와 검색어 속성 포함
		return dao.PetSitter_Select_All(adopt_second);
	}
	
	@Override
	public int getCount_Adrr(AdopttimeDto adopt) {
		//paging에 검색을 위한 필드와 검색어 속성 포함
		return dao.getCount_Adrr(adopt);
	}
	
	@Override
	public List<PetsitterDto> PetSitter_Select_Addr(AdopttimeDto_second adopt_second) {
		//paging에 검색을 위한 필드와 검색어 속성 포함
		return dao.PetSitter_Select_Addr(adopt_second);
	}
	
	@Override
	public int getCount_Add_Date(AdopttimeDto adopt) {
		//paging에 검색을 위한 필드와 검색어 속성 포함
		return dao.getCount_Add_Date(adopt);
	}
	
	@Override
	public List<PetsitterDto> PetSitter_Select_Addr_date(AdopttimeDto_second adopt_second) {
		//paging에 검색을 위한 필드와 검색어 속성 포함
		return dao.PetSitter_Select_Addr_date(adopt_second);
	}

	@Override
	public int getCount_Adrr_terms(AdopttimeDto adopt) {
		//paging에 검색을 위한 필드와 검색어 속성 포함
		return dao.getCount_Adrr_terms(adopt);
	}
	
	@Override
	public List<PetsitterDto> select_Adrr_terms(AdopttimeDto_second adopt_second) {
		//paging에 검색을 위한 필드와 검색어 속성 포함
		return dao.select_Adrr_terms(adopt_second);
	}

	@Override
	public int getCount_Add_Date_Terms(AdopttimeDto adopt) {
		//paging에 검색을 위한 필드와 검색어 속성 포함
		return dao.getCount_Add_Date_Terms(adopt);
	}
	
	@Override
	public List<PetsitterDto> PetSitter_Select_Add_Date_Terms(AdopttimeDto_second adopt_second) {
		//paging에 검색을 위한 필드와 검색어 속성 포함
		return dao.PetSitter_Select_Add_Date_Terms(adopt_second);
	}
	
	@Override
	public int getCount_terms(AdopttimeDto adopt) {
		//paging에 검색을 위한 필드와 검색어 속성 포함
		return dao.getCount_terms(adopt);
	}
	
	@Override
	public List<PetsitterDto> PetSitter_Select_terms(AdopttimeDto_second adopt_second) {
		//paging에 검색을 위한 필드와 검색어 속성 포함
		return dao.PetSitter_Select_terms(adopt_second);
	}
	
	@Override
	public int getCount_Date(AdopttimeDto adopt) {
		//paging에 검색을 위한 필드와 검색어 속성 포함
		return dao.getCount_Date(adopt);
	}
	
	@Override
	public List<PetsitterDto> PetSitter_Select_Date(AdopttimeDto_second adopt_second) {

		return dao.PetSitter_Select_Date(adopt_second);
	}
	
	@Override
	public int getCount_Date_terms(AdopttimeDto adopt) {
		//paging에 검색을 위한 필드와 검색어 속성 포함
		return dao.getCount_Date_terms(adopt);
	}
	
	@Override
	public List<PetsitterDto> PetSitter_Select_Date_terms(AdopttimeDto_second adopt_second) {

		return dao.PetSitter_Select_Date_terms(adopt_second);
	}
}
