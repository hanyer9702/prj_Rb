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
	
	private static String namespace = "com.rbproject.store.modules.member.MemberMpp";
	
	public int selectOneCount(MemberVo vo) {
		return sqlSession.selectOne(namespace + ".selectOneCount", vo);
	}

	public List<Member> selectList(MemberVo vo){ 
		return sqlSession.selectList(namespace + ".selectList", vo);
	}
	
	public Member selectOne(MemberVo vo){ 
		return sqlSession.selectOne(namespace + ".selectOne", vo);
	}
	
	public List<Member> selectCode(Member dto){ 
		return sqlSession.selectList(namespace + ".selectCode", dto);
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
	
	public List<Member> selectListForCache() {
		return sqlSession.selectList(namespace + ".selectListForCache", "");
	}
	
	public List<Member> checkId(MemberVo vo) {
		System.out.println("dao");
		return sqlSession.selectList(namespace + ".checkId", vo);
	}
	
}