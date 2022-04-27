package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.addLedger;

public class allLedgerDAO {
	private Connection conn;

	public allLedgerDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	
	public List<addLedger> getLedger() throws Throwable
	{
		List<addLedger> list = new ArrayList<addLedger>();
		addLedger a=null;
		String sql = " select * from ledger_info";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs= ps.executeQuery();
		
		while (rs.next()) {
			a= new addLedger();
			a.setLedgerId(rs.getInt(1));
			a.setLedgerName(rs.getString(2));
			a.setContactNo(rs.getString(3));
			a.setEmail(rs.getString(4));
			a.setAddress(rs.getString(5));
			a.setGstNo(rs.getString(6));
			a.setProfile(rs.getString(7));
			a.setBankName(rs.getString(8));
			a.setBranchName(rs.getString(9));
			a.setIfcsCode(rs.getString(10));
			a.setAccountType(rs.getString(11));
			a.setAccountNumber(rs.getString(12));
			a.setLedgerId(rs.getInt(13));
			list.add(a);
			
		}
		
		return list;
		
	}
	public addLedger getLedgerInfo(String name) throws Throwable
	{
		addLedger a=null;
		String sql = " select * from ledger_info where Name=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, name);
		ResultSet rs= ps.executeQuery();
		
		while (rs.next()) {
			a= new addLedger();
			a.setLedgerId(rs.getInt(1));
			a.setLedgerName(rs.getString(2));
			a.setContactNo(rs.getString(3));
			a.setEmail(rs.getString(4));
			a.setAddress(rs.getString(5));
			a.setGstNo(rs.getString(6));
			a.setProfile(rs.getString(7));
			a.setBankName(rs.getString(8));
			a.setBranchName(rs.getString(9));
			a.setIfcsCode(rs.getString(10));
			a.setAccountType(rs.getString(11));
			a.setAccountNumber(rs.getString(12));
			a.setLedgerId(rs.getInt(13));
		}
		return a;
		
		
	}

}
