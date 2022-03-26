package com.rbproject.store.modules.member;

import java.util.List;

public interface MemberService {
	
	public int selectOneCount(MemberVo vo) throws Exception;
	
	public List<Member> selectList(MemberVo vo) throws Exception; 
	public Member selectOne(MemberVo vo) throws Exception;
	public int insert(Member dto) throws Exception; 
	public int update(Member dto) throws Exception;
	
	public List<Member> selectCode(Member dto) throws Exception;
	public String checkId(MemberVo vo) throws Exception;
}