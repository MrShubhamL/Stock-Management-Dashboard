package com.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;

import com.entity.Products;

public class EditDAO {

	private Connection conn;

	public EditDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean editProduct(Products p)
	{
		boolean f=false;
		
		try {
			
			String sql= "update products set BrandName= ?,HSNNo=?,Rate=?,Quantity=?,TotalAmount=?,GST=?,CGST=?,Weight=? where Id=? ";
			PreparedStatement ps= conn.prepareStatement(sql);
			

			ps.setString(1, p.getMaterialName());
			ps.setInt(2, p.getHsn());
			ps.setDouble(3, p.getRate());
			ps.setInt(4, p.getQty());
			ps.setDouble(5, p.getTotal());
			ps.setDouble(6, p.getGst());
			ps.setDouble(7, p.getCgst());
			ps.setDouble(8, p.getWeight());
			
			ps.setInt(9, p.getId());
			
			int i= ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
			
			
			
			
		} catch (Throwable e) {
			System.out.println(e);
		}
		
		return f;
	}
	
	
}
