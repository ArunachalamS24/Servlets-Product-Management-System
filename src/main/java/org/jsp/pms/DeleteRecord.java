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

@WebServlet(urlPatterns = "/delete", loadOnStartup = 0)
public class DeleteRecord extends HttpServlet{
	
	private static String url = "jdbc:mysql://localhost:3306/advanced-java";
	private static String user = "root";
	private static String pass = "root";

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		Connection con = null;
		PreparedStatement s = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, user, pass);
			s = con.prepareStatement("delete from product where id = ?");
			s.setInt(1, id);
			
			String res = s.executeUpdate()+ " Row Deleted";
			req.setAttribute("del", res);
			RequestDispatcher rd = req.getRequestDispatcher("/view");
			rd.forward(req, resp);
			
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
