package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DBConnection;
import com.dao.NewMaterial;
import com.dao.StockDAO;
import com.entity.MyProducts;
import com.entity.Stock;

@WebServlet("/addNewMaterial")
public class AddNewMaterialServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("materialName");
		int hsn = Integer.parseInt(req.getParameter("hsn"));
		double rate = Double.parseDouble(req.getParameter("rate"));
		String unitName = req.getParameter("UnitName");
//		System.out.println(name);
//		System.out.println(hsn);
//		System.out.println(weight);
//		System.out.println(qty);
//		System.out.println(rate);
		
		MyProducts mp = new MyProducts();
		mp.setMaterialName(name);
		mp.setHsn(hsn);
		mp.setRate(rate);
		mp.setUnit(unitName);
		
		
		HttpSession session = req.getSession();
		try {
			NewMaterial dao2 = new NewMaterial(DBConnection.getConnection());
			boolean f2 = dao2.addInMyProducts(mp);
			if(f2) {
				session.setAttribute("Successfull", "Successfully Added");
				resp.sendRedirect("addProduct.jsp");
			}
			else {
				session.setAttribute("Failed", "Something wents wrong!");
				resp.sendRedirect("addProduct.jsp");
			}
			
		} catch (Throwable e) {
			System.out.println(e);
		}
	}
	
}
