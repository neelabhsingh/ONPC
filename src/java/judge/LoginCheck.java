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
public class LoginCheck extends HttpServlet {

    Connection cn;
    Statement st;
    ResultSet rs;

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        String id = request.getParameter("login");
        String password = request.getParameter("key");

        String id1 = "", password1 = "";
        int flag = 0;

        if (id.equals("optimists") && password.equals("mcaacm")) {

            HttpSession session = request.getSession(true);
            session.setMaxInactiveInterval(10000);
            session.setAttribute("user", id);
            session.setAttribute("uploadStatus", "0");
            response.sendRedirect("home1.jsp");

        } else {
            try {
                Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                cn = DriverManager.getConnection("jdbc:odbc:sp");
                st = cn.createStatement();

                String q = "select * from login";
                rs = st.executeQuery(q);
                while (rs.next()) {
                    id1 = rs.getString(1);
                    password1 = rs.getString(2);

                    if (id1.equals(id) && password1.equals(password)) {
                        flag = 1;
                    }
                    if (id1.equals(id) && password1.equals(password) && id.equals("admin")) {
                        flag = 2;
                    }
                }
                cn.close();
            } catch (Exception e) {
                out.println(e);
            }
            if (flag == 2) {
                HttpSession session = request.getSession(true);
                session.setMaxInactiveInterval(12000);
                session.setAttribute("user", id);
                session.setAttribute("uploadStatus", "0");
                response.sendRedirect("adminPage.jsp");
            } else if (flag == 0) {
                out.println("<script language='JavaScript'> " +
                        "alert('User Name does not exist.If you are a new user please register.');" +
                        "location.href='index.jsp'" +
                        "</script>");
            } else if (flag == 1) {

                HttpSession session = request.getSession(true);
                session.setMaxInactiveInterval(10000);
                session.setAttribute("user", id);
                session.setAttribute("uploadStatus", "0");
                response.sendRedirect("home.jsp");

            }
        }
    }
}
