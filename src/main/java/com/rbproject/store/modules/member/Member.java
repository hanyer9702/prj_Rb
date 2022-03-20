package com.rbproject.store.modules.member;

import java.util.Date;

public class Member {
	
	private String ifmmSeq = "";
	private String ifmmName= "";
	private String ifmmId = "";
	private String ifmmGender = "";
	private Date ifmmDob;
	private String ifmmSaved = "";
	private String ifmmMarriage = "";
	private Date ifmmMarriageDate;
	private Integer ifmmChildrenNum = 0;
	private String ifmmFavoriteColor = "";
	private Integer ifmmEmailConsentNy;
	private Integer ifmmSmsConsentNy;
	private Integer ifmmPushConsentNy;
	private String ifmaAddress = "";
	private String ifmaZipcode = "";
	private String ifmaAddress1 = "";
	private String ifmaAddress2 = "";
	private String ifaoUrl = "";
	private String ifmmSns = "";
	private String ifmeEmailFull = "";
	private String ifjqQuestionCd = "";
	private String ifjqAnswer = "";
	private String ifmpTelecom = "";
	private String ifmpNumber = "";
	private String ifmpNumberDash = "";
	private String ifmpHomeNumber = "";
	private String ifnaName = "";
	private String ifmpFaxNumber = "";
	private Integer ifmmDelNy;
	private String ifmmPassword = "";
	private String ifnaSeq = "";
	private Integer ifmpTelecomCd = 0;
	private Integer ifmmSavedCd = 0;
	private Integer ifaoSnsTypeCd = 0;
	private Integer ifmmMarriageCd = 0;
	private Integer ifmhHobbyCd = 0;
	private String ifmmDesc = "";
	private Integer ifmmGenderCd = 0;
	private String ifmpNumber1 = "";
	private String ifmpNumber2 = "";
	private String ifmpNumber3 = "";
	private String ifmpNumberAll = "";
	private String ifmpPhone1 = "";
	private String ifmpPhone2 = "";
	private String ifmpPhone3 = "";
	private String ifmpPhoneAll = "";
	private String ifmpFax1 = "";
	private String ifmpFax2 = "";
	private String ifmpFax3 = "";
	private String ifmpFaxAll = "";
	private String ifmeEmailAccount = "";
	private Integer ifmeEmailDomainCd = 0;
	private String ifmmRecommenderName = "";
	
//------------
	public String getIfmmSeq() {
		return ifmmSeq;
	}
	public void setIfmmSeq(String ifmmSeq) {
		this.ifmmSeq = ifmmSeq;
	}
	public String getIfmmId() {
		return ifmmId;
	}
	public void setIfmmId(String ifmmId) {
		this.ifmmId = ifmmId;
	}
	public String getIfmmName() {
		return ifmmName;
	}
	public void setIfmmName(String ifmmName) {
		this.ifmmName = ifmmName;
	}
	public Integer getIfmmDelNy() {
		return ifmmDelNy;
	}
	public void setIfmmDelNy(Integer ifmmDelNy) {
		this.ifmmDelNy = ifmmDelNy;
	}
	public String getIfmmGender() {
		return ifmmGender;
	}
	public void setIfmmGender(String ifmmGender) {
		this.ifmmGender = ifmmGender;
	}
	public Date getIfmmDob() {
		return ifmmDob;
	}
	public void setIfmmDob(Date ifmmDob) {
		this.ifmmDob = ifmmDob;
	}
	public String getIfmmSaved() {
		return ifmmSaved;
	}
	public void setIfmmSaved(String ifmmSaved) {
		this.ifmmSaved = ifmmSaved;
	}
	public String getIfmmMarriage() {
		return ifmmMarriage;
	}
	public void setIfmmMarriage(String ifmmMarriage) {
		this.ifmmMarriage = ifmmMarriage;
	}
	public Integer getIfmmChildrenNum() {
		return ifmmChildrenNum;
	}
	public void setIfmmChildrenNum(Integer ifmmChildrenNum) {
		this.ifmmChildrenNum = ifmmChildrenNum;
	}
	public String getIfmmFavoriteColor() {
		return ifmmFavoriteColor;
	}
	public void setIfmmFavoriteColor(String ifmmFavoriteColor) {
		this.ifmmFavoriteColor = ifmmFavoriteColor;
	}
	public Integer getIfmmEmailConsentNy() {
		return ifmmEmailConsentNy;
	}
	public void setIfmmEmailConsentNy(Integer ifmmEmailConsentNy) {
		this.ifmmEmailConsentNy = ifmmEmailConsentNy;
	}
	public Integer getIfmmSmsConsentNy() {
		return ifmmSmsConsentNy;
	}
	public void setIfmmSmsConsentNy(Integer ifmmSmsConsentNy) {
		this.ifmmSmsConsentNy = ifmmSmsConsentNy;
	}
	public Integer getIfmmPushConsentNy() {
		return ifmmPushConsentNy;
	}
	public void setIfmmPushConsentNy(Integer ifmmPushConsentNy) {
		this.ifmmPushConsentNy = ifmmPushConsentNy;
	}
	public String getIfmaAddress() {
		return ifmaAddress;
	}
	public void setIfmaAddress(String ifmaAddress) {
		this.ifmaAddress = ifmaAddress;
	}
	public String getIfmmSns() {
		return ifmmSns;
	}
	public void setIfmmSns(String ifmmSns) {
		this.ifmmSns = ifmmSns;
	}
	public String getIfaoUrl() {
		return ifaoUrl;
	}
	public void setIfaoUrl(String ifaoUrl) {
		this.ifaoUrl = ifaoUrl;
	}
	public String getIfmeEmailFull() {
		return ifmeEmailFull;
	}
	public void setIfmeEmailFull(String ifmeEmailFull) {
		this.ifmeEmailFull = ifmeEmailFull;
	}
	public String getIfjqAnswer() {
		return ifjqAnswer;
	}
	public void setIfjqAnswer(String ifjqAnswer) {
		this.ifjqAnswer = ifjqAnswer;
	}
	public String getIfmpTelecom() {
		return ifmpTelecom;
	}
	public void setIfmpTelecom(String ifmpTelecom) {
		this.ifmpTelecom = ifmpTelecom;
	}
	public String getIfmpNumber() {
		return ifmpNumber;
	}
	public void setIfmpNumber(String ifmpNumber) {
		this.ifmpNumber = ifmpNumber;
	}
	public String getIfmpNumberDash() {
		return ifmpNumberDash;
	}
	public void setIfmpNumberDash(String ifmpNumberDash) {
		this.ifmpNumberDash = ifmpNumberDash;
	}
	public String getIfnaName() {
		return ifnaName;
	}
	public void setIfnaName(String ifnaName) {
		this.ifnaName = ifnaName;
	}
	public String getIfmpHomeNumber() {
		return ifmpHomeNumber;
	}
	public void setIfmpHomeNumber(String ifmpHomeNumber) {
		this.ifmpHomeNumber = ifmpHomeNumber;
	}
	public String getIfmpFaxNumber() {
		return ifmpFaxNumber;
	}
	public void setIfmpFaxNumber(String ifmpFaxNumber) {
		this.ifmpFaxNumber = ifmpFaxNumber;
	}
	public Date getIfmmMarriageDate() {
		return ifmmMarriageDate;
	}
	public void setIfmmMarriageDate(Date ifmmMarriageDate) {
		this.ifmmMarriageDate = ifmmMarriageDate;
	}
	public String getIfmmPassword() {
		return ifmmPassword;
	}
	public void setIfmmPassword(String ifmmPassword) {
		this.ifmmPassword = ifmmPassword;
	}
	public String getIfnaSeq() {
		return ifnaSeq;
	}
	public void setIfnaSeq(String ifnaSeq) {
		this.ifnaSeq = ifnaSeq;
	}
	public String getIfmaZipcode() {
		return ifmaZipcode;
	}
	public void setIfmaZipcode(String ifmaZipcode) {
		this.ifmaZipcode = ifmaZipcode;
	}
	public String getIfmaAddress1() {
		return ifmaAddress1;
	}
	public void setIfmaAddress1(String ifmaAddress1) {
		this.ifmaAddress1 = ifmaAddress1;
	}
	public String getIfmaAddress2() {
		return ifmaAddress2;
	}
	public void setIfmaAddress2(String ifmaAddress2) {
		this.ifmaAddress2 = ifmaAddress2;
	}
	public Integer getIfmpTelecomCd() {
		return ifmpTelecomCd;
	}
	public void setIfmpTelecomCd(Integer ifmpTelecomCd) {
		this.ifmpTelecomCd = ifmpTelecomCd;
	}
	public Integer getIfmmSavedCd() {
		return ifmmSavedCd;
	}
	public void setIfmmSavedCd(Integer ifmmSavedCd) {
		this.ifmmSavedCd = ifmmSavedCd;
	}
	public Integer getIfaoSnsTypeCd() {
		return ifaoSnsTypeCd;
	}
	public void setIfaoSnsTypeCd(Integer ifaoSnsTypeCd) {
		this.ifaoSnsTypeCd = ifaoSnsTypeCd;
	}
	public Integer getIfmmMarriageCd() {
		return ifmmMarriageCd;
	}
	public void setIfmmMarriageCd(Integer ifmmMarriageCd) {
		this.ifmmMarriageCd = ifmmMarriageCd;
	}
	public Integer getIfmhHobbyCd() {
		return ifmhHobbyCd;
	}
	public void setIfmhHobbyCd(Integer ifmhHobbyCd) {
		this.ifmhHobbyCd = ifmhHobbyCd;
	}
	public String getIfmmDesc() {
		return ifmmDesc;
	}
	public void setIfmmDesc(String ifmmDesc) {
		this.ifmmDesc = ifmmDesc;
	}
	public Integer getIfmmGenderCd() {
		return ifmmGenderCd;
	}
	public void setIfmmGenderCd(Integer ifmmGenderCd) {
		this.ifmmGenderCd = ifmmGenderCd;
	}
	public String getIfmpNumber1() {
		return ifmpNumber1;
	}
	public void setIfmpNumber1(String ifmpNumber1) {
		this.ifmpNumber1 = ifmpNumber1;
	}
	public String getIfmpNumber2() {
		return ifmpNumber2;
	}
	public void setIfmpNumber2(String ifmpNumber2) {
		this.ifmpNumber2 = ifmpNumber2;
	}
	public String getIfmpNumber3() {
		return ifmpNumber3;
	}
	public void setIfmpNumber3(String ifmpNumber3) {
		this.ifmpNumber3 = ifmpNumber3;
	}
	public String getIfmpNumberAll() {
		return ifmpNumberAll;
	}
	public void setIfmpNumberAll(String ifmpNumberAll) {
		this.ifmpNumberAll = ifmpNumber1 + ifmpNumber2 + ifmpNumber3;
	}
	public String getIfmpPhone1() {
		return ifmpPhone1;
	}
	public void setIfmpPhone1(String ifmpPhone1) {
		this.ifmpPhone1 = ifmpPhone1;
	}
	public String getIfmpPhone2() {
		return ifmpPhone2;
	}
	public void setIfmpPhone2(String ifmpPhone2) {
		this.ifmpPhone2 = ifmpPhone2;
	}
	public String getIfmpPhone3() {
		return ifmpPhone3;
	}
	public void setIfmpPhone3(String ifmpPhone3) {
		this.ifmpPhone3 = ifmpPhone3;
	}
	public String getIfmpPhoneAll() {
		return ifmpPhoneAll;
	}
	public void setIfmpPhoneAll(String ifmpPhoneAll) {
		this.ifmpPhoneAll = ifmpPhone1 + ifmpPhone2 + ifmpPhone3;
	}
	public String getIfmpFax1() {
		return ifmpFax1;
	}
	public void setIfmpFax1(String ifmpFax1) {
		this.ifmpFax1 = ifmpFax1;
	}
	public String getIfmpFax2() {
		return ifmpFax2;
	}
	public void setIfmpFax2(String ifmpFax2) {
		this.ifmpFax2 = ifmpFax2;
	}
	public String getIfmpFax3() {
		return ifmpFax3;
	}
	public void setIfmpFax3(String ifmpFax3) {
		this.ifmpFax3 = ifmpFax3;
	}
	public String getIfmpFaxAll() {
		return ifmpFaxAll;
	}
	public void setIfmpFaxAll(String ifmpFaxAll) {
		this.ifmpFaxAll = ifmpFax1 + ifmpFax2 + ifmpFax3;
	}
	public String getIfjqQuestionCd() {
		return ifjqQuestionCd;
	}
	public void setIfjqQuestionCd(String ifjqQuestionCd) {
		this.ifjqQuestionCd = ifjqQuestionCd;
	}
	public String getIfmeEmailAccount() {
		return ifmeEmailAccount;
	}
	public void setIfmeEmailAccount(String ifmeEmailAccount) {
		this.ifmeEmailAccount = ifmeEmailAccount;
	}
	public Integer getIfmeEmailDomainCd() {
		return ifmeEmailDomainCd;
	}
	public void setIfmeEmailDomainCd(Integer ifmeEmailDomainCd) {
		this.ifmeEmailDomainCd = ifmeEmailDomainCd;
	}
	public String getIfmmRecommenderName() {
		return ifmmRecommenderName;
	}
	public void setIfmmRecommenderName(String ifmmRecommenderName) {
		this.ifmmRecommenderName = ifmmRecommenderName;
	}
	
}