package com.rbproject.store.modules.member;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;



@Repository
public class MemberDao {
	
	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	@Inject
	@Resource(name = "sqlSessionOracle")
	private SqlSession sqlSessionOracle;
	
	private static String namespace = "com.rbproject.store.modules.member.MemberMpp";
	
	public int selectOneCount(MemberVo vo) {
		return sqlSession.selectOne(namespace + ".selectOneCount", vo);
	}

	public List<Member> selectList(MemberVo vo){ 
		return sqlSession.selectList(namespace + ".selectList", vo);
	}
	
	public List<Member> selectListOracle(MemberVo vo){ 
		return sqlSessionOracle.selectList(namespace + ".selectListOracle", vo);
	}
	
	public Member selectOne(MemberVo vo){ 
		return sqlSession.selectOne(namespace + ".selectOne", vo);
	}
	
	public List<Member> selectCode(Member dto){ 
		return sqlSession.selectList(namespace + ".selectCode", dto);
	}
	
	public List<Member> selectHobby(Member dto){
		return sqlSession.selectList(namespace + ".selectHobby", dto);
	}
	
	public int insertInfrMember(Member dto) {
		return sqlSession.insert(namespace + ".insertInfrMember", dto);
	}
	public int insertInfrMemberNationality(Member dto) {
		return sqlSession.insert(namespace + ".insertInfrMemberNationality", dto);
	}
	public int insertInfrMemberAddress(Member dto) {
		return sqlSession.insert(namespace + ".insertInfrMemberAddress", dto);
	}
	public int insertInfrMemberMobile(Member dto) {
		return sqlSession.insert(namespace + ".insertInfrMemberMobile", dto);
	}
	public int insertInfrMemberPhone(Member dto) {
		return sqlSession.insert(namespace + ".insertInfrMemberPhone", dto);
	}
	public int insertInfrMemberFax(Member dto) {
		return sqlSession.insert(namespace + ".insertInfrMemberFax", dto);
	}
	public int insertInfrMemberEmail(Member dto) {
		return sqlSession.insert(namespace + ".insertInfrMemberEmail", dto);
	}
	public int insertInfrMemberJoinQna(Member dto) {
		return sqlSession.insert(namespace + ".insertInfrMemberJoinQna", dto);
	}
	public int insertInfrMemberAddressOnline(Member dto) {
		return sqlSession.insert(namespace + ".insertInfrMemberAddressOnline", dto);
	}
	public int insertInfrMemberHobby(Member dto) {
		return sqlSession.insert(namespace + ".insertInfrMemberHobby", dto);
	}
	
	public int updateMember(Member dto) {
		return sqlSession.update(namespace + ".updateMember", dto);
	}
	public int updateAddress(Member dto) {
		return sqlSession.update(namespace + ".updateAddress", dto);
	}
	public int updateMobile(Member dto) {
		return sqlSession.update(namespace + ".updateMobile", dto);
	}
	public int updatePhone(Member dto) {
		return sqlSession.update(namespace + ".updatePhone", dto);
	}
	public int updateFax(Member dto) {
		return sqlSession.update(namespace + ".updateFax", dto);
	}
	public int updateEmail(Member dto) {
		return sqlSession.update(namespace + ".updateEmail", dto);
	}
	public int updateJoinQna(Member dto) {
		return sqlSession.update(namespace + ".updateJoinQna", dto);
	}
	public int updateAddressOnline(Member dto) {
		return sqlSession.update(namespace + ".updateAddressOnline", dto);
	}
	public int updateHobby(Member dto) {
		return sqlSession.update(namespace + ".updateHobby", dto);
	}
	
	public Member checkPassword(MemberVo vo) {
		return sqlSession.selectOne(namespace + ".checkPassword", vo);
	}
	public int updatePassword(MemberVo vo) {
		return sqlSession.update(namespace + ".updatePassword", vo);
	}
	
	public List<Member> selectListForCache() {
		return sqlSession.selectList(namespace + ".selectListForCache", "");
	}
	
	public List<Member> checkId(MemberVo vo) {
		System.out.println("dao");
		return sqlSession.selectList(namespace + ".checkId", vo);
	}
	
	public int updateDelete(MemberVo vo) {
		return sqlSession.update(namespace + ".updateDelete", vo);
	}
	
	public int deleteMember(MemberVo vo) {
		return sqlSession.delete(namespace + ".deleteMember", vo);
	}
	public int deleteMemberNationality(MemberVo vo) {
		return sqlSession.delete(namespace + ".deleteMemberNationality", vo);
	}
	public int deleteMemberAddress(MemberVo vo) {
		return sqlSession.delete(namespace + ".deleteMemberAddress", vo);
	}
	public int deleteMemberMobile(MemberVo vo) {
		return sqlSession.delete(namespace + ".deleteMemberMobile", vo);
	}
	public int deleteMemberEmail(MemberVo vo) {
		return sqlSession.delete(namespace + ".deleteMemberEmail", vo);
	}
	public int deleteMemberJoinQna(MemberVo vo) {
		return sqlSession.delete(namespace + ".deleteMemberJoinQna", vo);
	}
	public int deleteMemberAddressOnline(MemberVo vo) {
		return sqlSession.delete(namespace + ".deleteMemberAddressOnline", vo);
	}
	public int deleteMemberHobby(MemberVo vo) {
		return sqlSession.delete(namespace + ".deleteMemberHobby", vo);
	}
	
//	�α���
	public Member selectOneLogin(Member dto) {
		return sqlSession.selectOne(namespace + ".selectOneLogin", dto);
	}
	
}