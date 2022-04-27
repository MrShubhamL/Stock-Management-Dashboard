package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Products;
import com.entity.addLedger;

public class allProducts {
	private Connection conn;
	
	
	
	
	public allProducts(Connection conn) {
		super();
		this.conn = conn;
	}




	public List<Products> getProduct() throws Throwable{
		List<Products> list = new ArrayList<Products>();
		Products p = null;
		String sql= " select * from products ";
		PreparedStatement ps= conn.prepareStatement(sql);
		ResultSet rs= ps.executeQuery();
		while ( rs.next())
		{
			p = new Products();
			p.setId(rs.getInt(1));
			p.setMaterialName(rs.getString(2));
			p.setHsn(rs.getInt(3));
			p.setRate(rs.getDouble(4));
			p.setQty(rs.getInt(5));
			p.setTotal(rs.getDouble(6));
			p.setDate(rs.getDate(7));
			p.setLedgerName(rs.getString(8));
			p.setContactNo(rs.getString(9));
			p.setEmail(rs.getString(10));
			p.setLedgerId(rs.getInt(11));
			p.setTime(rs.getTime(12));
			p.setUnit(rs.getString(13));
			list.add(p);
		}
		return list;
	}
	
	public List<Products> getMaterialName() throws Throwable{
		List<Products> list = new ArrayList<Products>();
		Products p = null;
		String sql= " select distinct BrandName from products ";
		PreparedStatement ps= conn.prepareStatement(sql);
		ResultSet rs= ps.executeQuery();
		while ( rs.next())
		{
			p = new Products();
			p.setMaterialName(rs.getString(1));
			list.add(p);
		}
		return list;
	}
	
	public Products getProductByNameAndHSN(String name, int hsn) throws Throwable{
		Products p = null;
		String sql= " select * from products where BrandName=? and HSNNo=?";
		PreparedStatement ps= conn.prepareStatement(sql);
		ps.setString(1, name);
		ps.setInt(2, hsn);
		ResultSet rs= ps.executeQuery();
		while ( rs.next())
		{
			p = new Products();
			p.setId(rs.getInt(1));
			p.setMaterialName(rs.getString(2));
			p.setHsn(rs.getInt(3));
			p.setRate(rs.getDouble(4));
			p.setQty(rs.getInt(5));
			p.setTotal(rs.getDouble(6));
			p.setDate(rs.getDate(7));
		}
		return p;
	}
	

	public List<Products> editProduct(int id) throws Throwable{
		List<Products> list = new ArrayList<Products>();
		Products p = null;
		String sql= " select * from products where Id=?";
		PreparedStatement ps= conn.prepareStatement(sql);
		ps.setInt(1, id);
		ResultSet rs= ps.executeQuery();
		while ( rs.next())
		{
			p = new Products();
			p.setId(rs.getInt(1));
			p.setMaterialName(rs.getString(2));
			p.setHsn(rs.getInt(3));
			p.setRate(rs.getDouble(4));
			p.setQty(rs.getInt(5));
			p.setTotal(rs.getDouble(6));
			p.setDate(rs.getDate(7));
			list.add(p);
		}
		return list;
	}

	public List<Products> getProductByLedgerName(String date) throws Throwable{
		List<Products> list = new ArrayList<Products>();
		Products p = null;
		String sql= " select * from products where ledgerName = ? ";
		PreparedStatement ps= conn.prepareStatement(sql);
		ps.setString(1, date);
		ResultSet rs= ps.executeQuery();
		while ( rs.next())
		{
			p = new Products();
			p.setId(rs.getInt(1));
			p.setMaterialName(rs.getString(2));
			p.setHsn(rs.getInt(3));
			p.setRate(rs.getDouble(4));
			p.setQty(rs.getInt(5));
			p.setTotal(rs.getDouble(6));
			p.setDate(rs.getDate(7));
			p.setLedgerId(11);
			list.add(p);
		}
		return list;
	}
	public List<Products> getProductByLedgerName2(String name) throws Throwable{
		List<Products> list = new ArrayList<Products>();
		Products p = null;
		String sql= " select distinct BrandName from products where ledgerName = ? ";
		PreparedStatement ps= conn.prepareStatement(sql);
		ps.setString(1, name);
		ResultSet rs= ps.executeQuery();
		while ( rs.next())
		{
			p = new Products();
			p.setMaterialName(rs.getString(1));
			list.add(p);
		}
		return list;
	}
	
	
	
	
	public List<Products> getProductByLedgerDateAndName(String date, String name) throws Throwable{
		List<Products> list = new ArrayList<Products>();
		Products p = null;
		String sql= " select * from products where Date = ? and ledgerName=?";
		PreparedStatement ps= conn.prepareStatement(sql);
		ps.setString(1, date);
		ps.setString(2, name);
		ResultSet rs= ps.executeQuery();
		while ( rs.next())
		{
			p = new Products();
			p.setId(rs.getInt(1));
			p.setMaterialName(rs.getString(2));
			p.setHsn(rs.getInt(3));
			p.setQty(rs.getInt(5));
			p.setRate(rs.getDouble(4));
			p.setTotal(rs.getDouble(6));
			p.setDate(rs.getDate(7));
			p.setLedgerName(rs.getString(8));
			p.setContactNo(rs.getString(9));
			p.setEmail(rs.getString(10));
			p.setLedgerId(11);
			p.setUnit(rs.getString(13));
			list.add(p);
		}
		return list;
	}
	
	public Products getLedgerInfo(String date, String name) throws Throwable{
		Products p = null;
		String sql= " select * from products where Date = ? and ledgerName=?";
		PreparedStatement ps= conn.prepareStatement(sql);
		ps.setString(1, date);
		ps.setString(2, name);
		ResultSet rs= ps.executeQuery();
		while ( rs.next())
		{
			p = new Products();
			p.setId(rs.getInt(1));
			p.setMaterialName(rs.getString(2));
			p.setHsn(rs.getInt(3));
			p.setQty(rs.getInt(5));
			p.setRate(rs.getDouble(4));
			p.setTotal(rs.getDouble(6));
			p.setDate(rs.getDate(7));
			p.setLedgerName(rs.getString(8));
			p.setContactNo(rs.getString(9));
			p.setEmail(rs.getString(10));
			p.setLedgerId(11);
		}
		return p;
	}
	
	public addLedger getLedgerNameAndConatct(String name , String contact) throws Throwable{
		addLedger p = null;
		String sql= " select * from ledger_info where Name =? and Contact=?";
		PreparedStatement ps= conn.prepareStatement(sql);
		ps.setString(1, name);
		ps.setString(2, contact);
		ResultSet rs= ps.executeQuery();
		while ( rs.next())
		{
			p = new addLedger();
			p.setId(rs.getInt(1));
			p.setLedgerName(rs.getString(2));
			p.setContactNo(rs.getString(3));
			p.setEmail(rs.getString(4));
			p.setAddress(rs.getString(5));
			p.setGstNo(rs.getString(6));
		}
		return p;
	}
	

	
}

