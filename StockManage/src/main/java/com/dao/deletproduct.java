package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.entity.Products;

public class deletproduct {
	private Connection conn;

	public deletproduct(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean deletproducts(int id)
	{
		boolean f=false;
		
		try {
			
			String sql= "delete from products where Id=?";
//			for delet
			PreparedStatement ps2= conn.prepareStatement(sql);
			ps2.setInt(1,id);
		
			int d=ps2.executeUpdate();
			if(d==1)
			{
				f=true;
			}
			
		} catch (Throwable e) {
			System.out.println(e);
		}
		return f;
		
	}
	
	
}
