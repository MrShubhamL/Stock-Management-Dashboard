package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class DeleteProductDAO {
	private Connection conn;

	public DeleteProductDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean deleteProduct(int id) {
		boolean f = false;
		try {
			String sql = "delete from stock where ID = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i = ps.executeUpdate();
			if(i==1) {
				f = true;
			}
		} catch (Throwable e) {
			System.out.println("Delete Servlet Error : " + e);
		}
		return f;
	}
	
}
