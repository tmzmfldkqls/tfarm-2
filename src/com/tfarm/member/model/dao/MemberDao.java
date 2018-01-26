package com.tfarm.member.model.dao;

import java.util.List;
import java.util.Map;

import com.tfarm.member.model.MemberDetailDto;
import com.tfarm.member.model.MemberDto;
import com.tfarm.member.model.ZipDto;

public interface MemberDao {
	
	int idCheck(String id);
	int pwCheck(Map<String,String> map);
	String idfind(Map<String, String> map);
	int pwUpdate(Map<String, String> map);
	String bringPw(String number);
	void modifyMember(MemberDetailDto memberDetailDto);
	void modifyDetail(MemberDetailDto memberDetailDto);
	
	
	List<ZipDto> zipSearch(String dong);
	int registerMember(MemberDetailDto memberDetailDto);
	int socialRegister(Map<String, String> map);
	void deleteMember(String id);
	MemberDetailDto login(Map<String, String> map);
	MemberDetailDto socialLogin(String pass);
	MemberDetailDto getSoInfo(int memNo);
	List<MemberDetailDto> listMember(Map<String, String> map);
	
}
