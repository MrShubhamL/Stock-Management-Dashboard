package com.servlet;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.conn.DBConnection;
import com.dao.NewLedgerDAO;
import com.entity.addLedger;

@WebServlet("/AddLedger")
@MultipartConfig
public class ledgerServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String LedgerName = req.getParameter("ledgerName");
		String contactNo = req.getParameter("contactNo");
		String email = req.getParameter("email");
		String address = req.getParameter("address");
		String gstNo = req.getParameter("gstno");
		Part part = req.getPart("profile");
		String profile = part.getSubmittedFileName();

		String bankName = req.getParameter("bankName");
		String ifscCode = req.getParameter("ifscCode");
		String accoutType = req.getParameter("accountType");
		String accountNumber = req.getParameter("accountNumber");
		String confirmAccNo = req.getParameter("confirm");
		String branchName = req.getParameter("branchName");

		System.out.println(LedgerName);
		System.out.println(branchName);
		System.out.println(profile);

		try {
			Connection conn = new DBConnection().getConnection();
			String sql = " select LedgerId from ledger_info ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			List<Integer> list = new LinkedList<>();
			while (rs.next()) {
				list.add(rs.getInt(1));

			}
			if (list.size() != 0) {
				int ledgerId = list.get(list.size() - 1);
				int ledgerId2 = ledgerId + 1;

				addLedger ad = new addLedger();
				ad.setLedgerName(LedgerName);
				ad.setContactNo(contactNo);
				ad.setEmail(email);
				ad.setAddress(address);
				ad.setGstNo(gstNo);
				ad.setProfile(profile);
				ad.setBankName(bankName);
				ad.setIfcsCode(ifscCode);
				ad.setAccountType(accoutType);
				ad.setAccountNumber(accountNumber);
				ad.setBranchName(branchName);
				ad.setLedgerId(ledgerId2);
				HttpSession session = req.getSession();

				try {
					if (accountNumber.equals(confirmAccNo)) {

						NewLedgerDAO dao = new NewLedgerDAO(DBConnection.getConnection());
						boolean f = dao.newLedger(ad);
						if (f) {
							String path = getServletContext().getRealPath("") + "Ledger_Profile";
							File file = new File(path);
							part.write(path + File.separator + profile);
							System.out.println(path);

							session.setAttribute("LSuccessfull", dao);
							resp.sendRedirect("newLeadger.jsp");
						} else {

							session.setAttribute("LFailed", dao);
							resp.sendRedirect("newLeadger.jsp");
						}
					} else {
						session.setAttribute("CFailed", "Confirm Account Number");
						resp.sendRedirect("newLeadger.jsp");

					}

				} catch (Throwable e) {
					System.out.println(e);
				}

			}
			else {
				
				addLedger ad= new addLedger();
				ad.setLedgerName(LedgerName);
				ad.setContactNo(contactNo);
				ad.setEmail(email);
				ad.setAddress(address);
				ad.setGstNo(gstNo);
				ad.setProfile(profile);
				ad.setBankName(bankName);
				ad.setIfcsCode(ifscCode);
				ad.setAccountType(accoutType);
				ad.setAccountNumber(accountNumber);
				ad.setBranchName(branchName);
				ad.setLedgerId(1000);
				
				HttpSession session = req.getSession();
				
				try {
					if(accountNumber.equals(confirmAccNo)) {
						
					
					
					NewLedgerDAO dao = new NewLedgerDAO(DBConnection.getConnection());
					boolean f= dao.newLedger(ad);
					if(f) {
						String path= getServletContext().getRealPath("")+"Ledger_Profile";
						File file = new File(path);
						part.write(path + File.separator + profile);
						System.out.println(path);
						
						session.setAttribute("LSuccessfull", dao);
						resp.sendRedirect("newLeadger.jsp");
						}else {
							
							session.setAttribute("LFailed", dao);
							resp.sendRedirect("newLeadger.jsp");
						}
					}else {
						session.setAttribute("CFailed", "Confirm Account Number");
						resp.sendRedirect("newLeadger.jsp");
						
					}
					
						
					
				} catch (Throwable e) {
					System.out.println(e);
				}
			}
		} catch (Throwable e) {
			System.out.println(e + "Ledger Servlet");
		}

	}

}
