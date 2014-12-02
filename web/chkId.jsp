<%-- 
    Document   : chkId
    Created on : Oct 2, 2009, 5:19:11 AM
    Author     : vishwesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%!
    Connection cn;
    Statement st;
    ResultSet rs;
    
    String q="";
    
        %>
        
        <%
            q = request.getParameter("q");
        %>
        
        
        <%

            if (q.equals("")) {
                out.println("");
            } else {

                try {
                    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                    cn = DriverManager.getConnection("Jdbc:Odbc:sp");
                    st = cn.createStatement();
                    String query = "Select * from login where tid='" + q + "'";
                    rs = st.executeQuery(query);

                    boolean b = rs.next();

                    if (b) {
                        out.println("<div style=\"background-color:red\">" + q + " is already used.<br> Try something  else.</div>");
                    } else {
                        out.println("<div style=\"background-color:green\">" + q + " is a valid id.</div>");
                    }

                } catch (Exception e) {
                    out.print(e);
                }
            }
        %> 
        
        
    
    </body>
</html>
