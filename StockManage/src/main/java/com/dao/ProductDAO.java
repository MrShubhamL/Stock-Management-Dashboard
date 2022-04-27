package com.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;

import com.entity.Products;

public class ProductDAO {
	private Connection conn;

	public ProductDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean addProduct(Products p) {
		boolean f = false;
		try {
			String sql = "insert into products (BrandName,HSNNo,Rate,"+
		"Quantity,TotalAmount,Date,ledgerName,"+
		"contactNo,email,ledgerId,Time, Unit)"+
		" values (?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, p.getMaterialName());
			ps.setInt(2, p.getHsn());
			ps.setDouble(3, p.getRate());
			ps.setInt(4, p.getQty());
			ps.setDouble(5, p.getTotal());;
			ps.setDate(6, (Date) p.getDate());
			ps.setString(7, p.getLedgerName());
			ps.setString(8, p.getContactNo());
			ps.setString(9, p.getEmail());
			ps.setInt(10, p.getLedgerId());
			ps.setTime(11, p.getTime());
			ps.setString(12, p.getUnit());
			int i = ps.executeUpdate();
			if(i==1) {
				f = true;
			}
		} catch (Throwable e) {
			System.out.println(e);
		}
		
		return f;
	}
	public boolean UpdateProduct(Products p) {
		boolean f = false;
		try {
			String sql = "update products set BrandName=?,HSNNo=?,Rate=?,"+
					"Quantity=?,TotalAmount=?,Date=?,ledgerName=?,"+
					"contactNo=?,email=?,ledgerId=?"+
					" where BrandName = ? and HSNNo = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, p.getMaterialName());
			ps.setInt(2, p.getHsn());
			ps.setDouble(3, p.getRate());
			ps.setInt(4, p.getQty());
			ps.setDouble(5, p.getTotal());
			ps.setDate(6, (Date) p.getDate());
			ps.setString(7, p.getLedgerName());
			ps.setString(8, p.getContactNo());
			ps.setString(9, p.getEmail());
			ps.setInt(10, p.getLedgerId());
			ps.setString(11, p.getMaterialName());
			ps.setInt(12, p.getHsn());
			int i = ps.executeUpdate();
			if(i==1) {
				f = true;
			}
		} catch (Throwable e) {
			System.out.println(e);
		}
		
		return f;
	}
}
