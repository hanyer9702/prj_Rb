package com.rbproject.store.modules.member;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberDao dao;
	
	@Override
	public int selectOneCount(MemberVo vo) throws Exception {
		return dao.selectOneCount(vo);
	}
	
	@Override
	public List<Member> selectList(MemberVo vo) throws Exception {
		return dao.selectList(vo); 
	}

	@Override
	public Member selectOne(MemberVo vo) throws Exception {
		return dao.selectOne(vo);
	}

	@Override
	public int insert(Member dto) throws Exception {
		return dao.insert(dto);
	}

	@Override
	public int update(Member dto) throws Exception {
		return dao.update(dto);
	}
	

	@Override
	public List<Member> selectCode(Member dto) throws Exception {
		return dao.selectCode(dto);
	}

	@PostConstruct
	public void selectListForCache() throws Exception{
		List<Member> codeLIstFromDb = (ArrayList<Member>) dao.selectListForCache();
		
		Member.cachedCodeArrayList.clear();
		Member.cachedCodeArrayList.addAll(codeLIstFromDb);
		System.out.println("cachedCodeArrayList: " + Member.cachedCodeArrayList.size() + " Checked!");		
	}
	
	public static List<Member> selectListCachedCode(String ifcgSeq) throws Exception {
		List<Member> rt = new ArrayList<Member>();
		for(Member codeRow : Member.cachedCodeArrayList) {
			if(codeRow.getIfcdSeq().equals(ifcgSeq)) {
				rt.add(codeRow);
			} else {
				// by pass
			}
		}
		
		return rt;
	}

	@Override
	public String checkId(MemberVo vo) throws Exception {
		System.out.println("impl");
		int tmp = 0;
		List<Member> member = dao.checkId(vo);
		
		if (!member.isEmpty()) {
			tmp = 0;
		} else {
			tmp = 1;
		}
		System.out.println("impl");
		return tmp + "";
	}
}