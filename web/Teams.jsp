<%-- 
    Document   : Teams
    Created on : Oct 25, 2009, 8:55:33 PM
    Author     : vishwesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <link href="style.css" rel="stylesheet" type="text/css" />
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Online Programming Judge</title>
        <style>
            .style5 {
                color: #FFFFFF;
                font-weight: bold;
                font-family: "Times New Roman", Times, serif;
                font-size: 16px;
            }
            .style9 {
                font-family: "Times New Roman", Times, serif;
                font-size: 18px;
                color: #FFFFFF;
            }
        </style>        
    </head>    
    <body>
        
       <html>
    <head>
        <link href="style.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" type="text/css" href="roundedCorner1.css">

        <script type="text/javascript" src="form.js"></script>

        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Online Programming Judge</title>
        <style>



        </style>
    </head>
    <body>

        <table align="center" border="0" style="width:800px;">
            <tr bgcolor="#000077">
                <td align="center" style="">
                    <br>
                    <font face="Comic Sans MS" size="6" style="color:white;"><center>
                        <b> ONLINE PROGRAMMING JUDGE <br></br>
                    A WAR OF CODERS</b></center>
                    </font>



                </td>
            </tr>
     <tr bgcolor="#292929">
                <td height="38">     
                    
                    <%String id = (String) session.getAttribute("user");%>
                    <% if (id == null) {%>
                    <div id="header">
                        <ul>
                            <li> <a href="index.jsp" >Home</a></li>
                            <li class="home">Teams</li>                            
                            <li><a href="Status.jsp" >Status</a> </li>
                            <li> <a href="Result.jsp" >Result</a> </li>
                            <li> <a href="Rules.jsp" >Rules</a></li>
                            <li> <a href="faq.jsp" >FAQ</a> </li>
                            <li> <a href="About.jsp" >About</a> </li>
                            <li> <a href="sponsers.jsp" >Winners</a> </li>
                        </ul>
                    </div> 
                    
                    <% } else if (id.equals("admin")) {%>
                    <div id="header">
                        <ul>
                            <li> <a href="adminPage.jsp" >Home</a></li>
                            <li class="home">Teams</li>                                                                    
                            <li><a href="Status.jsp" >Status</a> </li>
                            <li> <a href="Result.jsp" >Result</a> </li>
                            <li> <a href="Rules.jsp" >Rules</a></li>
                            <li> <a href="faq.jsp" >FAQ</a> </li>
                            <li> <a href="About.jsp" >About</a> </li>                                                        
                            <li> <a href="sponsers.jsp" >Winners</a> </li>
                            <li> <a href="Logout" >Logout</a> </li> 
                        </ul>
                    </div>  
                    
                    <% } else {%>
                    <div id="header">
                        <ul>
                            <li> <a href="home.jsp">Home</a></li>
                            <li class="home">Teams</li>                            
                            <li><a href="Status.jsp" >Status</a> </li>
                            <li> <a href="Result.jsp" >Result</a> </li>
                            <li> <a href="Rules.jsp" >Rules</a></li>
                            <li> <a href="faq.jsp" >FAQ</a> </li>
                            <li> <a href="About.jsp" >About</a> </li>
                            <li> <a href="sponsers.jsp" >Winners</a> </li>
                            <li> <a href="Logout" >Logout</a> </li> 
                        </ul>
                    </div>                     
                    <% }%>
                </td>
            </tr>                          
        </table>
        <table width="800" height="353" border="0" align="center">
            <tr >
                <td width="588" height="349">
                    
                    <% String exam_id = (String) session.getAttribute("user");%>
                    
                    <%! Connection cn;
    Statement st;
    ResultSet rs;
    String id = "", name1 = "", name2 = " ", college = "";
    int sno = 1;
                    %>
                    
                    <%	try {
                    %>
                    <%				Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            cn = DriverManager.getConnection("jdbc:odbc:sp");
            st = cn.createStatement();

            String query = "Select * from student";
            rs = st.executeQuery(query);
                    %>
                    
                    <table border="1" width="800" align="center">
                        <tr style="background-color: #CCCCCC">
                            <td align="center" style="width:50px;">
                                <b>S. No.</b>
                            </td>
                            <td align="center" style="width:150px; max-width:200px;">
                                <b>Team ID</b>
                            </td>
                            <td align="center" style="width:150px; max-width:200px;">
                                <b> Member1</b>
                            </td>
                            <td align="center" style="width:150px; max-width:200px;">
                                <b>Member2</b>
                            </td>
                            <td align="center" style="width:150px; max-width:200px;">
                                <b>College</b>
                            </td>
                        </tr>                  
                        
                        <%sno = 0;
            String rowColor = "#ffcc00";
            while (rs.next()) {
                sno++;
                        %>
                        <%
                id = rs.getString(1);
                name1 = rs.getString(2);
                name2 = rs.getString(3);
                college = rs.getString(4);

                if (rowColor.equals("#ffcc00")) {
                    rowColor = "#ccff00";
                } else {
                    rowColor = "#ffcc00";
                }

                        %>
                        
                        <tr style="background-color:<%=rowColor%>; color:black; width:150px; max-width:200px;">
                            <td align="center">
                                <%=sno%>
                            </td>
                            <td align="center">
                                <%=id%>
                            </td>
                            <td align="center">
                                <%if (name1 == null) {
                    ;
                } else {%>
                                <%=name1%> <%}%> 
                            </td>
                            <td align="center">
                                <%if (name2 == null || name2.equals("") || name2.equals(" ")) {

                    ;%>
                                &nbsp;
                                <%

} else {%>
                                <%=name2%> <%}%> 
                            </td>
                            <td align="center">
                                <%if (college == null || college.equals("") || college.equals(" ")) {
                    ;%>
                                &nbsp;
                                <%
} else {%>
                                <%=college%> <%}%> 
                            </td>
                        </tr>                 
                        
                        <%	}%>
                        <%	cn.close(); %>
                        <%	} catch (Exception e) {
                        %>
                        <%		e.printStackTrace();%>
                        <%=e%>
                        <%	} %> 
                        
                    </table>                  
                </td>
            </tr>
        </table>             
        <TABLE width=800 height=5% ALIGN="center" BORDER="0">
            <TR bgcolor="#292929">
                <TD align="center" color=red height=28>
                    <A href="About.jsp" STYLE="color: white;">About Us</A> | 
            <A href="Contact.jsp" STYLE="color: white;">Contact Us </A></TD></TR>
            
        </TABLE>
    </body>
</html>
