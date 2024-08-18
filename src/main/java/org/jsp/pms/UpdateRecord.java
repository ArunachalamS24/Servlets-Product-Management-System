package org.jsp.pms;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(urlPatterns = "/updaterec", loadOnStartup = 0)
public class UpdateRecord extends HttpServlet{
	
	private static String url = "jdbc:mysql://localhost:3306/advanced-java";
	private static String user = "root";
	private static String pass = "root";

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int id = Integer.parseInt( req.getParameter("Id"));
		String name = req.getParameter("Name");
		String brand = req.getParameter("Brand");
		String cat = req.getParameter("Category");
		Double price = Double.parseDouble(req.getParameter("Price"));
		Connection con = null;
		PreparedStatement s = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url,user,pass);
			s = con.prepareStatement("update product set name=?,brand=?,category=?,price=? where id = ?");
			s.setString(1, name);
			s.setString(2, brand);
			s.setString(3, cat);
			s.setDouble(4, price);
			s.setInt(5, id);
			
			s.execute();
			resp.sendRedirect("view");
		} 
		catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		finally {
			if(s!=null) {
				try {
					s.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}

}
