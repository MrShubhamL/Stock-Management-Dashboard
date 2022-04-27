package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DBConnection;
import com.dao.DeleteProductDAO;

@WebServlet("/deleteProduct")
public class DeleteProductServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		HttpSession session = req.getSession();
		try {
			DeleteProductDAO dao = new DeleteProductDAO(DBConnection.getConnection());
			boolean f = dao.deleteProduct(id);
			if(f) {
				session.setAttribute("Deleted", "Product Delete Successfully!");
				resp.sendRedirect("allStock.jsp");
			}
			else {
				session.setAttribute("Error", "Server Error! Please try again!");
				resp.sendRedirect("allStock.jsp");
			}
		} catch (Throwable e) {
			System.out.println(e);
		}
	}

}
