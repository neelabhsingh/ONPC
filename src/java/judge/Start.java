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
public class Start extends HttpServlet {

    Connection cn, cn1, cn2;
    Statement st, st1, st2;
    ResultSet rs, rs1, rs2;

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        //int num = Integer.parseInt(request.getParameter("num"));
        int counter = 0;
        int problems = Integer.parseInt(request.getParameter("problems"));
        String c = request.getParameter("c");
        String cpp = request.getParameter("cpp");
        String java = request.getParameter("java");
        String csharp = request.getParameter("csharp");

        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            cn = DriverManager.getConnection("jdbc:odbc:sp");
            st = cn.createStatement();

            String q = "delete * from result";
            int executeUpdate = st.executeUpdate(q);

            String q1 = "delete * from status";
            int executeUpdate1 = st.executeUpdate(q1);

            cn.close();
        } catch (Exception e) {
            out.println("aa " + e);
        }

        String eid = "";
        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            cn = DriverManager.getConnection("jdbc:odbc:sp");
            st = cn.createStatement();

            String q = "select * from exam_id where id = '1'";
            rs = st.executeQuery(q);
            while (rs.next()) {
                eid = rs.getString(2);
            }
            cn.close();
        } catch (Exception e) {
            out.println("bb " + e);
        }


        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            cn1 = DriverManager.getConnection("jdbc:odbc:sp");
            st1 = cn1.createStatement();

            String query = "Select * from marks where exam_id = '" + eid + "' order by marks1 desc";
            rs1 = st1.executeQuery(query);

            counter = 0;
            while (rs1.next()) {

                counter++;
                String id = rs1.getString(1);
                String name1 = rs1.getString(2);
                String exam_id = rs1.getString(4);

                String college = " ";
                String name2 = " ";


                try {
                    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                    cn2 = DriverManager.getConnection("jdbc:odbc:sp");
                    st2 = cn2.createStatement();

                    String q4 = "select * from student where id = '" + id + "'";
                    //out.println(q4);
                    rs2 = st2.executeQuery(q4);

                    while (rs2.next()) {
                        name2 = rs2.getString(4);
                        college = rs2.getString(7);
                        //out.println("*" + name2 + "*" + college);
                        break;
                    }
                    cn2.close();
                } catch (Exception e) {
                    out.println("dd " + e);
                }                
            }
            cn1.close();
        } catch (Exception e) {
            out.println("ff " + e);
        }

        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            cn = DriverManager.getConnection("jdbc:odbc:sp");
            st = cn.createStatement();

            String q = "delete * from exam_config";
            int a = st.executeUpdate(q);

            cn.close();
        } catch (Exception e) {
            out.println("gg " + e);
        }

        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            cn = DriverManager.getConnection("jdbc:odbc:sp");
            st = cn.createStatement();

            String q = "insert into exam_config values ( '1'," + problems + "," + c + "," + cpp + "," + java + "," + csharp + ")";
            boolean a = st.execute(q);
            cn.close();
        } catch (Exception e) {
            out.println("gg " + e);
        }
        response.sendRedirect("adminPage2.jsp");
    }
}
