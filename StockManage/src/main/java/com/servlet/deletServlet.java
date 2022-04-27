package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DBConnection;
import com.dao.deletproduct;
import com.entity.Products;

@WebServlet ("/Deletproduct")
public class deletServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int id= Integer.parseInt(req.getParameter("id"));
		
		
		
		Products p = new Products();
		p.setId(id);
		
		HttpSession session= req.getSession();
		
		try {
			
			deletproduct dao = new deletproduct(DBConnection.getConnection());
			boolean f= dao.deletproducts(id);
			if(f) {
				session.setAttribute("Deleted","Product Deleted Successfully!");
				resp.sendRedirect("allProduct.jsp");
			}
			else {
				session.setAttribute("FailedDelete","Something wents wrong!");
				resp.sendRedirect("allProduct.jsp");
			}
			
			
		} catch (Throwable e) {
			System.out.println(e);
		}
		
		
	}
	

	
	
}
