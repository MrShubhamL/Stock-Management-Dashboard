package com.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.SaleProduct;

public class SellingDAO {
	private Connection conn;

	public SellingDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	
	public boolean saleProduct(SaleProduct sp) {
		boolean f = false;
		try {	
			String sql = "insert into salling_stock (CustomerName,CustomerContact,CustomerEmail,"+
		"CustomerAddress,PayMode,MaterialName,HSN,Quantity,Total,Date,Time,Unit) values(?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, sp.getCustomerName());
			ps.setString(2, sp.getCutContact());
			ps.setString(3, sp.getCutEmial());
			ps.setString(4, sp.getCutAddress());
			ps.setString(5, sp.getPayMode());
			ps.setString(6, sp.getMaterialName());
			ps.setInt(7, sp.getHsn());
			ps.setInt(8, sp.getQty());
			ps.setDouble(9, sp.getTotal());
			ps.setDate(10, (Date) sp.getDate());
			ps.setTime(11, sp.getTime());
			ps.setString(12, sp.getUnit());
			int i = ps.executeUpdate();
			if(i==1) {
				f = true;
			}
		} catch (Throwable e) {
			System.out.println(e);
		}
		return f;
	}
	
	
	public List<SaleProduct> getSaleProductInfo(){
		List<SaleProduct> list = new ArrayList<SaleProduct>();
		SaleProduct sp = null;
		try {
			String sql = "select * from salling_stock";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				sp = new SaleProduct();
				sp.setCustomerName(rs.getString(2));
				sp.setCutContact(rs.getString(3));
				sp.setCutEmial(rs.getString(4));
				sp.setCutAddress(rs.getString(5));
				sp.setPayMode(rs.getString(6));
				sp.setMaterialName(rs.getString(7));
				sp.setHsn(rs.getInt(8));
				sp.setQty(rs.getInt(9));
				sp.setTotal(rs.getDouble(10));
				sp.setDate(rs.getDate(11));
				sp.setTime(rs.getTime(12));
				sp.setUnit(rs.getString(13));
				list.add(sp);
			}
			
		} catch (Throwable e) {
			// TODO: handle exception
			System.out.println(e);
		}
		return list;
	}
	
	public List<SaleProduct> getSoldProductInfo(String name, String contact){
		List<SaleProduct> list = new ArrayList<SaleProduct>();
		SaleProduct sp = null;
		try {
			String sql = "select * from salling_stock where CustomerName=? and CustomerContact=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, contact);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				sp = new SaleProduct();
				sp.setCustomerName(rs.getString(2));
				sp.setCutContact(rs.getString(3));
				sp.setCutEmial(rs.getString(4));
				sp.setCutAddress(rs.getString(5));
				sp.setPayMode(rs.getString(6));
				sp.setMaterialName(rs.getString(7));
				sp.setHsn(rs.getInt(8));
				sp.setQty(rs.getInt(9));
				sp.setTotal(rs.getDouble(10));
				sp.setDate(rs.getDate(11));
				sp.setTime(rs.getTime(12));
				sp.setUnit(rs.getString(13));
				list.add(sp);
			}
			
		} catch (Throwable e) {
			// TODO: handle exception
			System.out.println(e);
		}
		return list;
	}
	
	public List<SaleProduct> getSoldProductInfoByDateAndCustomerName(String date, String CustomerName){
		List<SaleProduct> list = new ArrayList<SaleProduct>();
		SaleProduct sp = null;
		try {
			String sql = "select * from salling_stock where Date=? and CustomerName=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, date);
			ps.setString(2, CustomerName);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				sp = new SaleProduct();
				sp.setCustomerName(rs.getString(2));
				sp.setCutContact(rs.getString(3));
				sp.setCutEmial(rs.getString(4));
				sp.setCutAddress(rs.getString(5));
				sp.setPayMode(rs.getString(6));
				sp.setMaterialName(rs.getString(7));
				sp.setHsn(rs.getInt(8));
				sp.setQty(rs.getInt(9));
				sp.setTotal(rs.getDouble(10));
				sp.setDate(rs.getDate(11));
				sp.setTime(rs.getTime(12));
				sp.setUnit(rs.getString(13));
				list.add(sp);
			}
			
		} catch (Throwable e) {
			// TODO: handle exception
			System.out.println(e);
		}
		return list;
	}
	
	public SaleProduct getSaleProductInfo(String name, String contact){
		SaleProduct sp = null;
		try {
			String sql = "select * from salling_stock where CustomerName=? and CustomerContact=? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, contact);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				sp = new SaleProduct();
				sp.setCustomerName(rs.getString(2));
				sp.setCutContact(rs.getString(3));
				sp.setCutEmial(rs.getString(4));
				sp.setCutAddress(rs.getString(5));
				sp.setPayMode(rs.getString(6));
				sp.setMaterialName(rs.getString(7));
				sp.setHsn(rs.getInt(8));
				sp.setQty(rs.getInt(9));
				sp.setTotal(rs.getDouble(10));
				sp.setDate(rs.getDate(11));
				sp.setTime(rs.getTime(12));
				sp.setUnit(rs.getString(13));
			}
			
		} catch (Throwable e) {
			// TODO: handle exception
			System.out.println(e);
		}
		return sp;
	}
	
	public List<SaleProduct> getSaleCustomer(){
		List<SaleProduct> list = new ArrayList<SaleProduct>();
		SaleProduct sp = null;
		try {
			String sql = "select distinct CustomerName from salling_stock";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				sp = new SaleProduct();
				sp.setCustomerName(rs.getString(1));
				list.add(sp);
			}
			
		} catch (Throwable e) {
			// TODO: handle exception
			System.out.println(e);
		}
		return list;
	}
	public List<SaleProduct> getSaleCustomerbyContact(){
		List<SaleProduct> list = new ArrayList<SaleProduct>();
		SaleProduct sp = null;
		try {
			String sql = "select distinct CustomerContact from salling_stock order by Id desc";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				sp = new SaleProduct();
				sp.setCutContact(rs.getString(1));
				list.add(sp);
			}
			
		} catch (Throwable e) {
			// TODO: handle exception
			System.out.println(e);
		}
		return list;
	}
	public List<SaleProduct> getCustomerContact(){
		List<SaleProduct> list = new ArrayList<SaleProduct>();
		SaleProduct sp = null;
		try {
			String sql = "select distinct CustomerContact from salling_stock";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				sp = new SaleProduct();
				sp.setCutContact(rs.getString(1));
				list.add(sp);
			}
			
		} catch (Throwable e) {
			// TODO: handle exception
			System.out.println(e);
		}
		return list;
	}
}
