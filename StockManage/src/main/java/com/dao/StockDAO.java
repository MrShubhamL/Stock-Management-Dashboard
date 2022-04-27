package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Stock;

public class StockDAO {
	private Connection conn;

	public StockDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean addInStock(Stock s) {
		boolean f = false;
		try {
			String sql = "insert into stock (MaterialName, HSN, Quantity, Rate, Unit) values (?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, s.getMaterialName());
			ps.setInt(2, s.getHsn());
			ps.setInt(3, s.getQuantity());
			ps.setDouble(4, s.getRate());
			ps.setString(5, s.getUnit());
			int i = ps.executeUpdate();
			if(i==1) {
				f = true;
			}
			
		} catch (Throwable e) {
			System.out.println(e);
		}
		return f;
	}
	

	
	public boolean SaleReturnStock(Stock s) {
		boolean f = false;
		try {
			String sql = "update stock set Quantity=?, Rate=? where MaterialName=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, s.getQuantity());
			ps.setDouble(2, s.getRate());
			ps.setString(3, s.getMaterialName());
			int i = ps.executeUpdate();
			if(i==1) {
				f = true;
			}
			
		} catch (Throwable e) {
			System.out.println(e);
		}
		return f;
	}


	
	public List<Stock> getStockInfo(){
		List<Stock> list = new ArrayList<Stock>();
		Stock s = null;
		try {
			String sql = "select ID, MaterialName from stock order by ID desc";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			int i = 0;
			while(rs.next() && i<4) {
				i++;
				s = new Stock();
				s.setId(rs.getInt(1));
				s.setMaterialName(rs.getString(2));
				list.add(s);
			}
		} catch (Throwable e) {
			System.out.println(e);
		}
		return list;
	}
	
	public List<Stock> getStockInfo2(){
		List<Stock> list = new ArrayList<Stock>();
		Stock s = null;
		try {
			String sql = "select ID, MaterialName from stock order by ID desc";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				s = new Stock();
				s.setId(rs.getInt(1));
				s.setMaterialName(rs.getString(2));
				list.add(s);
			}
		} catch (Throwable e) {
			System.out.println(e);
		}
		return list;
	}
	
	public List<Stock> getAllStockInfo(){
		List<Stock> list = new ArrayList<Stock>();
		Stock s = null;
		try {
			String sql = "select * from stock";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				s = new Stock();
				s.setId(rs.getInt(1));
				s.setMaterialName(rs.getString(2));
				s.setHsn(rs.getInt(3));
				s.setQuantity(rs.getInt(4));
				s.setRate(rs.getDouble(5));
				s.setUnit(rs.getString(6));
				list.add(s);
			}
		} catch (Throwable e) {
			System.out.println(e);
		}
		return list;
	}
	
	public Stock getStockProductWeight(String MaterialName){
		Stock s = null;
		try {
			String sql = "select Quantity, Rate from stock where MaterialName=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, MaterialName);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				s = new Stock();
				s.setQuantity(rs.getInt(1));
				s.setRate(rs.getDouble(2));
			}
		} catch (Throwable e) {
			System.out.println(e);
		}
		return s;
	}
	
	public List<Stock> getStockQty(String MaterialName){
		List<Stock> list = new ArrayList<Stock>();
		Stock s = null;
		try {
			String sql = "select SUM(Quantity) from stock where MaterialName = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, MaterialName);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				s = new Stock();
				s.setQuantity(rs.getInt(1));
				list.add(s);
			}
		} catch (Throwable e) {
			System.out.println(e);
		}
		return list;
	}
	

	
	public boolean updateStock(Stock s) {
		boolean f = false;
		try {
			String sql = "update stock set Quantity=?,Rate=?  where MaterialName=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, s.getQuantity());
			ps.setDouble(2, s.getRate());
			ps.setString(3, s.getMaterialName());
			int i = ps.executeUpdate();
			if(i==1) {
				f= true;
			}
		} catch (Throwable e) {
			System.out.println(e);
		}
		
		return f;
	}
	
}
