package com.servlet;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.sql.Date;
import java.sql.Time;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DBConnection;
import com.dao.SellingDAO;
import com.dao.StockDAO;
import com.entity.SaleProduct;
import com.entity.Stock;

@WebServlet("/NewProductSale")
public class SaleProducts extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String CustName = req.getParameter("custName");
		String CustContact = req.getParameter("custContact");
		String CustEmail = req.getParameter("custEmail");
		String CustAddress = req.getParameter("custAddress");
		String payMode = req.getParameter("payMode");
		int HSN = Integer.parseInt(req.getParameter("hsn"));
		String materialName = req.getParameter("materialName");

		int qty = Integer.parseInt(req.getParameter("qty"));
		double totalAmount = Double.parseDouble(req.getParameter("tAmount"));
		
		LocalDate l = LocalDate.now();
		Date date = Date.valueOf(l);
		
		LocalTime time = LocalTime.now();
		Time t = Time.valueOf(time);
		String unit = req.getParameter("unit");
		
		System.out.println(CustName);
		System.out.println(CustContact);
		System.out.println(CustEmail);
		System.out.println(CustAddress);
		System.out.println(payMode);
		System.out.println(materialName);
		System.out.println(HSN);
		System.out.println(qty);
		System.out.println(totalAmount);
		
		SaleProduct sp = new SaleProduct();
		sp.setCustomerName(CustName);
		sp.setCutContact(CustContact);
		sp.setCutEmial(CustEmail);
		sp.setCutAddress(CustAddress);
		sp.setPayMode(payMode);
		sp.setMaterialName(materialName);
		sp.setHsn(HSN);
		sp.setQty(qty);
		sp.setTotal(totalAmount);
		sp.setDate(date);
		sp.setTime(t);
		sp.setUnit(unit);
		
		
		HttpSession session = req.getSession();
		try {
			StockDAO sDao = new StockDAO(DBConnection.getConnection());
			
			Stock sk = sDao.getStockProductWeight(materialName);
			int sQuantity = sk.getQuantity();
			double sTotal = sk.getRate();
			
			Stock stock = new Stock();
			double check = (sQuantity - qty);
			if(sTotal>=0 && check>=0) {
				stock.setQuantity(sQuantity - qty);
				stock.setRate(sTotal - totalAmount);
				stock.setMaterialName(materialName);
				SellingDAO dao = new SellingDAO(DBConnection.getConnection());
				StockDAO dao2 = new StockDAO(DBConnection.getConnection());
				boolean f = dao.saleProduct(sp);
				boolean f2 = dao2.updateStock(stock);
				if(f && f2) {
					session.setAttribute("ProductSaled", "Product Sale Successfully");
					resp.sendRedirect("saleProduct.jsp");
				}
				else {
					session.setAttribute("Failed", "Something wents wrong!");
					resp.sendRedirect("saleProduct.jsp");				
				}
			}
			else {
				session.setAttribute("ZeroAmount", "Zero");
				resp.sendRedirect("saleProduct.jsp");
			}
			
			
		} catch (Throwable e) {
			System.out.println(e);
		}
	}
	
}
