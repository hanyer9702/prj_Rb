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
	
	public int insert(Member dto) {
		sqlSession.insert(namespace + ".insertInfrMember", dto);
		sqlSession.insert(namespace + ".insertInfrMemberNationality", dto);
		sqlSession.insert(namespace + ".insertInfrMemberAddress", dto);
		sqlSession.insert(namespace + ".insertInfrMemberMobile", dto);
		sqlSession.insert(namespace + ".insertInfrMemberPhone", dto);
		sqlSession.insert(namespace + ".insertInfrMemberFax", dto);
		sqlSession.insert(namespace + ".insertInfrMemberEmail", dto);
		sqlSession.insert(namespace + ".insertInfrMemberJoinQna", dto);
		sqlSession.insert(namespace + ".insertInfrMemberAddressOnline", dto);
		sqlSession.insert(namespace + ".insertInfrMemberHobby", dto);
		
		return 1;
	}
	
	public int update(Member dto) {
		return sqlSession.update(namespace + ".update", dto);
	}
	
	public List<Member> selectListForCache() {
		return sqlSession.selectList(namespace + ".selectListForCache", "");
	}
	
	public List<Member> checkId(MemberVo vo) {
		System.out.println("dao");
		return sqlSession.selectList(namespace + ".checkId", vo);
	}
}