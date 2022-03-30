package com.rbproject.store.modules.member;

import java.util.List;

public interface MemberService {
	
	public int selectOneCount(MemberVo vo) throws Exception;
	
	public List<Member> selectList(MemberVo vo) throws Exception; 
	public Member selectOne(MemberVo vo) throws Exception;
	public List<Member> selectHobby(Member dto) throws Exception; 
	
	public int insert(Member dto) throws Exception; 
	public int update(Member dto, MemberVo vo) throws Exception;
	
	public List<Member> selectCode(Member dto) throws Exception;
	public List<Member> checkId(MemberVo vo) throws Exception;
	
	public Member checkPassword(MemberVo vo) throws Exception;
	public int updatePassword(MemberVo vo) throws Exception;
	
	public int updateDelete(MemberVo vo) throws Exception;
	public int delete(MemberVo vo) throws Exception;
	
	public int multiUele(MemberVo vo) throws Exception;
	public int multiDele(MemberVo vo) throws Exception;
}