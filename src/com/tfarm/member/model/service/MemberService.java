package com.tfarm.member.model.service;

import java.util.List;

import com.tfarm.member.model.MemberDetailDto;
import com.tfarm.member.model.MemberDto;
import com.tfarm.member.model.ZipDto;

public interface MemberService {
	
	int idCheck(String id);
	int pwCheck(String id, String pass);
	String idfind(String name, String email);
	int pwUpdate(String id, String joinCode);
	List<ZipDto> zipSearch(String dong);
	int registerMember(MemberDetailDto memberDetailDto);
	void deleteMember(String id);
	String bringPw(String number);
	MemberDetailDto login(String id, String pass);
	MemberDetailDto socialLogin(String pass);
	int modify(MemberDetailDto memberDetailDto);
	int socialRegister(String id, String  pass, String name, String email1, String email2);
	MemberDetailDto getSoInfo(int memNo);
	List<MemberDetailDto> listMember(String key, String word);

}
