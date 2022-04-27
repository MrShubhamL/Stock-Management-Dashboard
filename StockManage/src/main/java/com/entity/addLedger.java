package com.entity;

public class addLedger {
	private int id;
	private String ledgerName;
	private String contactNo;
	private String email;
	private String address;
	private String gstNo;
	private String profile;
	private String bankName;
	private String ifcsCode;
	private String accountType;
	private String accountNumber;
	private String branchName;
	private int ledgerId;
	public addLedger(int id, String ledgerName, String contactNo, String email, String address, String gstNo,
			String profile, String bankName, String ifcsCode, String accountType, String accountNumber,
			String branchName,int ledgerID) {
		super();
		this.id = id;
		this.ledgerName = ledgerName;
		this.contactNo = contactNo;
		this.email = email;
		this.address = address;
		this.gstNo = gstNo;
		this.profile = profile;
		this.bankName = bankName;
		this.ifcsCode = ifcsCode;
		this.accountType = accountType;
		this.accountNumber = accountNumber;
		this.branchName = branchName;
		this.ledgerId=ledgerID;
	}
	public addLedger() {
		super();
		
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getLedgerName() {
		return ledgerName;
	}
	public void setLedgerName(String ledgerName) {
		this.ledgerName = ledgerName;
	}
	public String getContactNo() {
		return contactNo;
	}
	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getGstNo() {
		return gstNo;
	}
	public void setGstNo(String gstNo) {
		this.gstNo = gstNo;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getIfcsCode() {
		return ifcsCode;
	}
	public void setIfcsCode(String ifcsCode) {
		this.ifcsCode = ifcsCode;
	}
	public String getAccountType() {
		return accountType;
	}
	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}
	public String getAccountNumber() {
		return accountNumber;
	}
	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}
	public String getBranchName() {
		return branchName;
	}
	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}
	
	public int getLedgerId() {
		return ledgerId;
	}
	public void setLedgerId(int ledgerId) {
		this.ledgerId = ledgerId;
	}
	@Override
	public String toString() {
		return "addLedger [id=" + id + ", ledgerName=" + ledgerName + ", contactNo=" + contactNo + ", email=" + email
				+ ", address=" + address + ", gstNo=" + gstNo + ", profile=" + profile + ", bankName=" + bankName
				+ ", ifcsCode=" + ifcsCode + ", accountType=" + accountType + ", accountNumber=" + accountNumber
				+ ", branchName=" + branchName + ", ledgerId=" + ledgerId + "]";
	}
	
	
}
