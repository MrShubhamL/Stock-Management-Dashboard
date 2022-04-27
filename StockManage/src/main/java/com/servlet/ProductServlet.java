package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DBConnection;
import com.dao.NewMaterial;
import com.dao.ProductDAO;
import com.dao.StockDAO;
import com.dao.allProducts;
import com.entity.Products;
import com.entity.Stock;

@WebServlet("/NewProductAdded")
public class ProductServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String materialName = req.getParameter("materialName");
			int HSN = Integer.parseInt(req.getParameter("hsn"));

			int QTY = Integer.parseInt(req.getParameter("qty"));
			String UnitName = req.getParameter("UnitName");
			double Rate = Double.parseDouble(req.getParameter("rate"));

			double Total = Double.parseDouble(req.getParameter("total"));
			
//			double cgst = Double.parseDouble(req.getParameter("cgst"));
//			double GST = Double.parseDouble(req.getParameter("gst"));
//
//			double IGST = Double.parseDouble(req.getParameter("igst"));

			String ledgerName = req.getParameter("ledgerName");
			String conatctNo = req.getParameter("contactNo");
			String email = req.getParameter("email");
			
			LocalDate l = LocalDate.now();
			Date date = Date.valueOf(l);
			
			LocalTime time = LocalTime.now();
			Time t = Time.valueOf(time);
			
			
			int ledgerId = Integer.parseInt(req.getParameter("LregiId"));

			System.out.println(materialName);
			System.out.println(HSN);

//			System.out.println(GST);
//			System.out.println(cgst);
//			System.out.println(IGST);

			System.out.println(QTY);
			System.out.println(Rate);
			System.out.println(Total);


			Products p = new Products();
			p.setMaterialName(materialName);
//			p.setGst(GST);
			p.setHsn(HSN);
			p.setQty(QTY);
			p.setRate(Rate);
			p.setTotal(Total);
//			p.setCgst(cgst);
			p.setLedgerName(ledgerName);
			p.setContactNo(conatctNo);
			p.setEmail(email);
			p.setDate(date);
			p.setLedgerId(ledgerId);
//			p.setIgst(IGST);
			p.setTime(t);
			p.setUnit(UnitName);
			
			Stock s = new Stock();
			s.setMaterialName(materialName);
			s.setHsn(HSN);
			s.setQuantity(QTY);
			s.setRate(Total);
			s.setUnit(UnitName);

			HttpSession session = req.getSession();

			ProductDAO dao2 = new ProductDAO(DBConnection.getConnection());
			StockDAO dao4 = new StockDAO(DBConnection.getConnection());
			boolean f = dao2.addProduct(p);
			boolean f2 = dao4.addInStock(s);
			if (f && f2) {
				session.setAttribute("Successfull", "Product Added Successfully!");
				resp.sendRedirect("addProduct.jsp");
			} else {
				session.setAttribute("Failed", "Something wents wrong!");
				resp.sendRedirect("addProduct.jsp");
				System.out.println("Error in Product Servlet");
			}

		} catch (Throwable e) {
			System.out.println(e);
		}

	}

}
