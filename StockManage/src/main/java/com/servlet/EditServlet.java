
package com.servlet;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DBConnection;
import com.dao.EditDAO;
import com.dao.allProducts;
import com.entity.Products;


@WebServlet ("/EditProduct")
public class EditServlet extends HttpServlet 
{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id= Integer.parseInt(req.getParameter("id"));
		String materialName = req.getParameter("materialName");
		int HSN = Integer.parseInt(req.getParameter("hsn"));
	
		double GST = Double.parseDouble(req.getParameter("gst"));
		int QTY = Integer.parseInt(req.getParameter("qty"));
		double Rate = Double.parseDouble(req.getParameter("rate"));
		double Total = Double.parseDouble(req.getParameter("total"));
		double cgst= Double.parseDouble(req.getParameter("cgst"));
		double weight = Double.parseDouble(req.getParameter("weight"));
		
		
//		System.out.println(id);
//		System.out.println(materialName);
//		System.out.println(HSN);
//		System.out.println(GST);
//		System.out.println(QTY);
//		System.out.println(Rate);
//		System.out.println(Total);
//		System.out.println(weight);
//		System.out.println(cgst);
		
		Products p = new Products();
		p.setId(id);
		p.setMaterialName(materialName);
		p.setGst(GST);
		p.setHsn(HSN);
		p.setQty(QTY);
		p.setRate(Rate);
		p.setTotal(Total);
		p.setCgst(cgst);
		p.setWeight(weight);
		
		HttpSession session= req.getSession();
		
		try {
			
			EditDAO dao = new EditDAO(DBConnection.getConnection());
			boolean f= dao.editProduct(p);
			if(f) {
				session.setAttribute("Successfull","Product Updated Successfully!");
				resp.sendRedirect("allProduct.jsp");
			}
			else {
				session.setAttribute("Failed","Something wents wrong!");
				resp.sendRedirect("allProduct.jsp");
			}
			
			
		} catch (Throwable e) {
			System.out.println(e);
		}
	}
	

}
