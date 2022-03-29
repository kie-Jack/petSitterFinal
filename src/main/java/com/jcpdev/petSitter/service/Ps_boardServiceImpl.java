package com.jcpdev.petSitter.service;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jcpdev.petSitter.dao.Ps_boardMapper;
import com.jcpdev.petSitter.model.Member;
import com.jcpdev.petSitter.model.Pet;
import com.jcpdev.petSitter.model.Ps_board;
import com.jcpdev.petSitter.model.R_board;
import com.jcpdev.petSitter.model.Reservation;

@Service
public class Ps_boardServiceImpl implements Ps_boardService {
	
	@Autowired
	Ps_boardMapper dao;

	// 펫시터 게시글 등록
	@Override
	public int psb_insert(Ps_board ps_board) {
		List<MultipartFile> files = ps_board.getFiles();
		StringBuilder sb = new StringBuilder();
		String path = "C:\\Users\\user\\Desktop\\upload";	// 윈도우용
//		String path = "/Users/choiyoungjae/Desktop/program/workspace/upload";	// 맥용

		if (files != null && files.size() > 0) {
			for (MultipartFile f : files) {
				String newpath="";
//				String fileName = "board_" + f.getOriginalFilename();   //원래 파일명
				String fileName = "pet_" + randomString(f.getOriginalFilename());   //원래 파일명
				if (!fileName.equals("")) {
					newpath = path + "\\" + fileName;   //업로드경로+파일명 -> 윈도우용
//					newpath = path + "//" + fileName;   //업로드경로+파일명 -> 맥용
//					sb.append(fileName).append(",");
					sb.append(fileName);
					// 선택한 파일을 서버로 전송
					File upfile = new File(newpath);
					try {
						f.transferTo(upfile);
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
					}
				}
            }
			ps_board.setG_fname(sb.toString());
         }
		
		return dao.psb_insert(ps_board);
	}

	public String randomString(String oldfile) {	// 랜덤문자열(숫자10개, 알파벳대소문자 사용)생성
	      int leftLimit = 48; // 숫자 '0'
	      int rightLimit = 122; // 알파벳 'z'
	      int targetStringLength = 10;
	      Random random = new Random();
	      String ext = oldfile.substring(oldfile.indexOf("."), oldfile.length());	// 확장자 추출
	      String rString = random.ints(leftLimit,rightLimit + 1)
	        .filter(i -> (i <= 57 || (i >= 65 && i <= 90) || i >= 97))		// 사용하지 않을 기호 제외
	        .limit(targetStringLength)
	        .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
	        .toString();
	      
	      //또는 UUID.randomUUID().toString();
	      return rString+ext;	// 랜덤문자열.확장자를 리턴
	   }
	   
	
	// 펫시터 게시글 불러오기
	@Override
	public Ps_board psb_getList(int psb_idx) {
		return dao.psb_getList(psb_idx);
	}
	
	// 펫 정보 불러오기
	@Override
	public List<Pet> p_getList(int idx) {
		return dao.p_getList(idx);
	}

	// 회원정보 불러오기
	@Override
	public Member m_getList(int idx) {
		return dao.m_getList(idx);
	}
	
	// 펫시터 평점 계산
	@Override
	public double rate(String ps_nick) {
		double rate = dao.rate(ps_nick);
		double rate1 = rate * 10;
		rate1 = ((double)Math.round(rate1))/10;
		return rate1;
	}

	// 후기 갯수
	@Override
	public String rateCnt(String ps_nick) {
		return dao.rateCnt(ps_nick);
	}
	
	// 예약정보 insert
	@Override
	public int psr_insert(Reservation reservation) {
		return dao.psr_insert(reservation);
	}

	// 펫시터 포인트 증가
	@Override
	public int plusPoint(Map<String, Object> map) {
		return dao.plusPoint(map);
	}

	// 이용자 포인트 감소
	@Override
	public int minusPoint(Map<String, Object> map) {
		return dao.minusPoint(map);
	}

	// 수익증가
	@Override
	public int plusIncome(Map<String, Object> map) {
		return dao.plusIncome(map);
	}

	// 후기게시글 불러오기
	@Override
	public List<R_board> r_getList(String ps_nick) {
		return dao.r_getList(ps_nick);
	}

	// 펫시터 게시글 수정
	@Override
	public int psb_update(Ps_board ps_board) {
		List<MultipartFile> files = ps_board.getFiles();
		StringBuilder sb = new StringBuilder();
		String path = "C:\\Users\\user\\Desktop\\upload";		// 윈도우 경로
//		String path = "/Users/choiyoungjae/Desktop/program/workspace/upload";	// 맥 경로

		if (files != null && files.size() > 0) {
			for (MultipartFile f : files) {
				String newpath="";
//				String fileName = "board_" + f.getOriginalFilename();   //원래 파일명
				String fileName = "pet_" + randomString(f.getOriginalFilename());   //원래 파일명
				if (!fileName.equals("")) {
					newpath = path + "\\" + fileName;   //업로드경로+파일명 : 윈도우 경로
//					newpath = path + "//" + fileName;   //업로드경로+파일명 : 맥 경로
//					sb.append(fileName).append(",");
					sb.append(fileName);
					// 선택한 파일을 서버로 전송
					File upfile = new File(newpath);
					try {
						f.transferTo(upfile);
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
					}
				}
            }
			ps_board.setG_fname(sb.toString());
         }
		
		return dao.psb_update(ps_board);
	}

	// 펫시터 게시글 삭제
	@Override
	public int psb_delete(int psb_idx) {
		return dao.psb_delete(psb_idx);
	}
	
	
	// 수익확인
	@Override
	public String checkIncome() {
		return dao.checkIncome();
	}
	
	// 펫시터 정보 불러오기(펫시터 게시글 이용)
	@Override
	public Member ps_getList(int psb_idx) {
		return dao.ps_getList(psb_idx);
	}

	// 결제요금 계산
	@Override
	public int calculate(String s_date, String f_date, String small, String middle, 
			String big, int userPoint) {
		
		int small2 = 0;
		int middle2 = 0;
		int big2 = 0;
		
		int money = 0;
		int vat = 0;
		int pay = 0;
		
		if (small == "")
			small2 = 0;
		else
			small2 = Integer.parseInt(small);
		
		if (middle == "")
			middle2 = 0;
		else
			middle2 = Integer.parseInt(middle);
		
		if (big == "")
			big2 = 0;
		else
			big2 = Integer.parseInt(big);
		
		// 날짜 미입력
		if (s_date.equals("") || f_date.equals(""))
			return -4;
		
		try {
			java.util.Date date1 = new SimpleDateFormat("yyyy-MM-dd").parse(s_date);
			java.util.Date date2 = new SimpleDateFormat("yyyy-MM-dd").parse(f_date);
			Calendar cmpDate1 = Calendar.getInstance();
			Calendar cmpDate2 = Calendar.getInstance();
			cmpDate1.setTime(date1);
			cmpDate2.setTime(date2);
			long diffSec = (cmpDate2.getTimeInMillis() - cmpDate1.getTimeInMillis()) / 1000;
			long diffDays = diffSec / (24 * 60 * 60);
			
			// 시작일 > 종료일
			if (diffDays < 0) {
				return -2;
			}
			//시작일 = 종료일(당일치기)
			else if (diffDays == 0) {
				diffDays = 1;
				
				money = (small2 * 50000) + (middle2 * 65000) + (big2 * 80000);
				vat = money / 10;
				pay = money + vat;
			}
			else {
				money = (int) (((small2 * 50000) + (middle2 * 65000) + (big2 * 80000)) * diffDays);
				vat = money / 10;
				pay = money + vat;
			}
			
		}
		catch (ParseException e) {
			e.printStackTrace();
		}
		
		if (small2 == 0 && middle2 == 0 && big2 == 0)
			return -1;
		else if (small2 < 0 || middle2 < 0 || big2 < 0)
			return -1;
		
		
		// 이용자의 포인트 부족
		if (userPoint < pay)
			return -3;
		else
			return money;
	}

}
