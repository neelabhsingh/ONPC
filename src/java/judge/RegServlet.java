/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package judge;

import java.io.*;
import java.net.*;

import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author vishwesh
 */
public class RegServlet extends HttpServlet {

    Connection cn;
    Statement st;
    ResultSet rs;

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        PrintWriter out = response.getWriter();

        String id = request.getParameter("login");
        String password = request.getParameter("key");
        String name1 = request.getParameter("name1");
        String name2 = request.getParameter("name2");
        String country = request.getParameter("country");
        String college = request.getParameter("college");
        String email = request.getParameter("email");
        String email2 = request.getParameter("email2");
        String mobile = request.getParameter("mobile");
        String mobile2 = request.getParameter("mobile2");  
        
        int flag = 0;

        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            cn = DriverManager.getConnection("jdbc:odbc:sp");
            st = cn.createStatement();
            PreparedStatement stat = cn.prepareStatement("SELECT * FROM student WHERE id=?");
            stat.setString(1, id);

            rs = stat.executeQuery();
            if (rs.next()) {
                flag = 1;
                out.println("<script language='JavaScript'> " +
                        "alert('User Name already exists');" +
                        "location.href='index.jsp';" +
                        "</script>");
            } else {
                cn.close();
            }
        } catch (Exception e) {
            out.println("Error" + e);
        }

        if (flag == 0) {
            try {
                Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                cn = DriverManager.getConnection("jdbc:odbc:sp");
                st = cn.createStatement();

                String q = "insert into student values('" + id + "','" + name1 + "','" + name2 + "','" + college + "','" + country + "','" + email + "','" + email2 + "','" + mobile + "','" + mobile2 + "')";
                st.executeQuery(q);
                cn.close();
            } catch (Exception e) {
                out.println(e);
            }
            //**     inserting in login 
            try {
                Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                cn = DriverManager.getConnection("jdbc:odbc:sp");
                st = cn.createStatement();

                String q = "insert into login values('" + id + "','" + password + "')";
                st.executeQuery(q);
                cn.close();
            } catch (Exception e) {
                out.println(e);
            }

            response.sendRedirect("success.jsp");
        }

    }
}
