package org.jsp.pms;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(urlPatterns = "/add", loadOnStartup = 0)
public class Add extends HttpServlet{
	
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
			s = con.prepareStatement("insert into product values(?,?,?,?,?)");
			s.setInt(1, id);
			s.setString(2, name);
			s.setString(3, brand);
			s.setString(4, cat);
			s.setDouble(5, price);
			
			String res = s.executeUpdate()+" Rows added";
			req.setAttribute("data", res);
			RequestDispatcher rd = req.getRequestDispatcher("add.jsp");
			rd.forward(req, resp);
			
		} 
		catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			RequestDispatcher rd = req.getRequestDispatcher("add.jsp");
			rd.forward(req, resp);
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
