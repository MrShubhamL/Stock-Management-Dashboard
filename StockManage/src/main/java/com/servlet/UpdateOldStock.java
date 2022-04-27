package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DBConnection;
import com.dao.StockDAO;
import com.entity.Stock;

@WebServlet("/updateStock")
public class UpdateOldStock extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String materialName = req.getParameter("materialName2");
		int quantity = Integer.parseInt(req.getParameter("qty"));
		double Total = Double.parseDouble(req.getParameter("tAmount"));
		
		HttpSession session = req.getSession();
		
		try {
			
			StockDAO sDao = new StockDAO(DBConnection.getConnection());
			Stock sk = sDao.getStockProductWeight(materialName);
			int sQuantity = sk.getQuantity();
			double sTotal = sk.getRate();
			
			Stock st = new Stock();
			st.setMaterialName(materialName);
			st.setQuantity(quantity+sQuantity);
			st.setRate(Total + sTotal);
			
			
			
			StockDAO dao = new StockDAO(DBConnection.getConnection());
			boolean f = dao.updateStock(st);
			if(f) {
				session.setAttribute("Updated", "Product updated successfully!");
				resp.sendRedirect("saleProduct.jsp");
			}
			else {
				session.setAttribute("Failed", "Something wents wrong!");
				resp.sendRedirect("saleProduct.jsp");
			}
		} catch (Throwable e) {
			System.out.println(e);
		}
		
	}

}
