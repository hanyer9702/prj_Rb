package com.rbproject.store.modules.member;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rbproject.store.common.util.UtilDateTime;
import com.rbproject.store.common.util.UtilMail;


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
	public List<Member> selectHobby(Member dto) throws Exception {
		return dao.selectHobby(dto);
	}

	@Override
	public Member selectOne(MemberVo vo) throws Exception {
		return dao.selectOne(vo);
	}

	@Override
	public int insert(Member dto) throws Exception {
		
		dto.setRegDateTime(UtilDateTime.nowDate());
		dto.setModDateTime(UtilDateTime.nowDate());
		
		dao.insertInfrMember(dto);
		dao.insertInfrMemberNationality(dto);
		dao.insertInfrMemberAddress(dto);
		dao.insertInfrMemberMobile(dto);
		dao.insertInfrMemberPhone(dto);
		dao.insertInfrMemberFax(dto);
		dao.insertInfrMemberEmail(dto);
		dao.insertInfrMemberJoinQna(dto);
		dao.insertInfrMemberAddressOnline(dto);
		
		for(int i = 0; i < dto.getIfmhHobbyCdArray().length; i++) {
			dto.setIfmhHobbyCd(dto.getIfmhHobbyCdArray()[i]);
			
			dao.insertInfrMemberHobby(dto);
		}
		
		UtilMail.sendMail();
		
		return 1;
	}

	@Override
	public int update(Member dto, MemberVo vo) throws Exception {
		dao.updateMember(dto);
		dao.updateAddress(dto);
		dao.updateMobile(dto);
		dao.updatePhone(dto);
		dao.updateFax(dto);
		dao.updateEmail(dto);
		dao.updateJoinQna(dto);
		dao.updateAddressOnline(dto);
		
		dao.deleteMemberHobby(vo);

		for(int i = 0; i < dto.getIfmhHobbyCdArray().length; i++) {
			dto.setIfmhHobbyCd(dto.getIfmhHobbyCdArray()[i]);
			
			dao.insertInfrMemberHobby(dto);
		}
		
		return 1;
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
			if(codeRow.getIfcgSeq().equals(ifcgSeq)) {
				rt.add(codeRow);
			} else {
				// by pass
			}
		}
		
		return rt;
	}

	@Override
	public List<Member> checkId(MemberVo vo) throws Exception {
		return dao.checkId(vo);
	}
	
	@Override
	public int updateDelete(MemberVo vo) throws Exception {
		return dao.updateDelete(vo);
	}
	
	@Override
	public int delete(MemberVo vo) throws Exception {
		dao.deleteMemberNationality(vo);
		dao.deleteMemberAddress(vo);
		dao.deleteMemberMobile(vo);
		dao.deleteMemberEmail(vo);
		dao.deleteMemberJoinQna(vo);
		dao.deleteMemberAddressOnline(vo);
		dao.deleteMemberHobby(vo);
		dao.deleteMember(vo);
		
		return 1;
	}

	@Override
	public Member checkPassword(MemberVo vo) throws Exception {
		return dao.checkPassword(vo);
	}

	@Override
	public int updatePassword(MemberVo vo) throws Exception {
		return dao.updatePassword(vo);
	}
	
	@Override
	public int multiUele(MemberVo vo) throws Exception{
		String[] checkboxSeqArray = vo.getCheckboxSeqArray();
		
		for(String checkboxSeq : checkboxSeqArray) {
			vo.setIfmmSeq(checkboxSeq);
			dao.updateDelete(vo);
		}
		
		return 1;
	}
	
	@Override
	public int multiDele(MemberVo vo) throws Exception{
		String[] checkboxSeqArray = vo.getCheckboxSeqArray();
		
		for(String checkboxSeq : checkboxSeqArray) {
			vo.setIfmmSeq(checkboxSeq);
			dao.deleteMemberNationality(vo);
			dao.deleteMemberAddress(vo);
			dao.deleteMemberMobile(vo);
			dao.deleteMemberEmail(vo);
			dao.deleteMemberJoinQna(vo);
			dao.deleteMemberAddressOnline(vo);
			dao.deleteMemberHobby(vo);
			dao.deleteMember(vo);
		}
		
		return 1;
	}

//	�α���
	@Override
	public Member selectOneLogin(Member dto) throws Exception {
		return dao.selectOneLogin(dto);
	}
	
}