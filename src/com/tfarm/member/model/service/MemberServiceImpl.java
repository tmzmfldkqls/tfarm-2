package com.tfarm.member.model.service;

import java.util.*;

import javax.mail.MessagingException;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tfarm.member.model.MemberDetailDto;
import com.tfarm.member.model.MemberDto;
import com.tfarm.member.model.ZipDto;
import com.tfarm.member.model.dao.MemberDao;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int idCheck(String id) {
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		return memberDao.idCheck(id);
	}

	@Override
	public List<ZipDto> zipSearch(String dong) {
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		return memberDao.zipSearch(dong);
	}
 
	@Override
	public int registerMember(MemberDetailDto memberDetailDto) {
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		return memberDao.registerMember(memberDetailDto);
	}

	@Override
	public MemberDetailDto login(String id, String pass) {
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		Map<String, String> map = new HashMap<String, String>();
		map.put("userid", id);
		map.put("userpwd", pass);
		return memberDao.login(map);
	}

	@Override
	public List<MemberDetailDto> listMember(String key, String word) {
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		Map<String, String> map = new HashMap<String, String>();
		map.put("key", key);
		map.put("word", word);
		return memberDao.listMember(map);
	}

	@Override
	public void deleteMember(String id) {
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		memberDao.deleteMember(id);
	}

	@Override
	public int pwCheck(String id, String pass) {
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		Map<String, String> map = new HashMap<String,String>();
		map.put("userid", id);
		map.put("userpwd", pass);
		return memberDao.pwCheck(map);
	}

	@Override
	public String bringPw(String number) {
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		return memberDao.bringPw(number);
	}

	@Override
	@Transactional
	public int modify(MemberDetailDto memberDetailDto) {
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		memberDao.modifyMember(memberDetailDto);
		memberDao.modifyDetail(memberDetailDto);			
		return 1;		
	}

	@Override
	public int socialRegister(String id, String  pass, String name, String email1, String email2) {
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		Map<String, String> map = new HashMap<String,String>();
		map.put("userid", id);
		map.put("userpw", pass);
		map.put("username", name);
		map.put("useremail1", email1);
		map.put("useremail2", email2);
		return memberDao.socialRegister(map);
	}

	@Override
	public MemberDetailDto socialLogin(String pass) {
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);		
		return memberDao.socialLogin(pass);
	}

	@Override
	public MemberDetailDto getSoInfo(int memNo) {
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		return memberDao.getSoInfo(memNo);
	}

	@Override
	public String idfind(String name, String email) {
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		Map<String, String> map = new HashMap<String,String>();
		map.put("name", name);
		map.put("email", email);
		return memberDao.idfind(map);
	}

	@Override
	public int pwUpdate(String id,String joinCode) {
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		Map<String, String> map = new HashMap<String,String>();
		map.put("id", id);
		map.put("joincode", joinCode);
		return memberDao.pwUpdate(map);
	}


}











