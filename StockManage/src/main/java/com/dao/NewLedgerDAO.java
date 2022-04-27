package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.addLedger;

public class NewLedgerDAO {
	private Connection conn;

	public NewLedgerDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean newLedger(addLedger l) throws Throwable{
		boolean f=false;
		
		try {
			
			String sql = "insert into ledger_info (Name,Contact,Email,Address,GSTNo,Profile,BankName,BranchName,IFSCCode,AccountType,AccountNumber,LedgerId)values(?,?,?,?,?,?,?,?,?,?,?,?)";
			
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, l.getLedgerName());
			ps.setString(2, l.getContactNo());
			ps.setString(3, l.getEmail());
			ps.setString(4, l.getAddress());
			ps.setString(5, l.getGstNo());
			ps.setString(6, l.getProfile());
			ps.setString(7, l.getBankName());
			ps.setString(8, l.getBranchName());
			ps.setString(9, l.getIfcsCode());
			ps.setString(10, l.getAccountType());
			ps.setString(11, l.getAccountNumber());
			ps.setInt(12, l.getLedgerId());
			
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
				
			
		} catch (Throwable e) {
			System.out.println(e);
		}
		return f;
		
	}
	public List<addLedger> listLedger(){
		List<addLedger> list=new ArrayList<>();
		addLedger ad= null;
		try {
			String sql =" select Name,Contact,Email from ledger_info ";
			PreparedStatement ps= conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				ad=new addLedger();
				ad.setLedgerName(rs.getString(1));
				ad.setContactNo(rs.getString(2));
				ad.setEmail(rs.getString(3));
				list.add(ad);
				
				
			}
			
			
		} catch (Throwable e) {
			System.out.println(e);
		}
		return list;
		
	}
}
