package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.MyProducts;
import com.entity.Stock;

public class NewMaterial {
	private Connection conn;

	public NewMaterial(Connection conn) {
		super();
		this.conn = conn;
	}
	
	
	public boolean addInMyProducts(MyProducts s) {
		boolean f = false;
		try {
			String sql = "insert into my_products (MaterialName, HSN,Rate,Unit) values (?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, s.getMaterialName());
			ps.setInt(2, s.getHsn());
			ps.setDouble(3, s.getRate());
			ps.setString(4, s.getUnit());
			int i = ps.executeUpdate();
			if(i==1) {
				f = true;
			}
			
		} catch (Throwable e) {
			System.out.println(e);
		}
		return f;
	}
	
	public List<MyProducts> getMaterialName(){
		List<MyProducts> list = new ArrayList<MyProducts>();
		MyProducts p = null;
		try {
			String sql = "select MaterialName from my_products ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				p = new MyProducts();
				p.setMaterialName(rs.getString(1));
				list.add(p);
			}
		} catch (Throwable e) {
			System.out.println(e);
		}
		
		return list;
	}
	
	
}
