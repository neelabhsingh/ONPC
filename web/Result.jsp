<%-- 
    Document   : Result
    Created on : Oct 25, 2009, 8:46:17 PM
    Author     : vishwesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
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
                            <li> <a href="Teams.jsp" >Teams</a></li>                            
                            <li><a href="Status.jsp" >Status</a> </li>
                            <li class="home">Result</li>
                            <li> <a href="Rules.jsp" >Rules</a> </li>
                            <li> <a href="faq.jsp" >FAQ</a> </li>
                            <li> <a href="About.jsp" >About</a> </li>
                            <li> <a href="sponsers.jsp" >Winners</a> </li>
                        </ul>
                    </div>     
                    <% } else if (id.equals("admin")) {%>
                    <div id="header">
                        <ul>
                            <li> <a href="adminPage.jsp" >Home</a></li>
                            <li> <a href="Teams.jsp" >Teams</a></li>                            
                            <li><a href="Status.jsp" >Status</a> </li>
                            <li class="home">Result</li>
                            <li> <a href="Rules.jsp" >Rules</a> </li>
                            <li> <a href="About.jsp" >About</a> </li>
                            <li> <a href="sponsers.jsp" >Sponsers</a> </li>
                            <li> <a href="Logout" >Logout</a> </li> 
                        </ul>
                    </div>                  
                    <% } else {%>
                    <div id="header">
                        <ul>
                            <li> <a href="home.jsp">Home</a></li>
                            <li> <a href="Teams.jsp" >Teams</a></li>                            
                            <li><a href="Status.jsp" >Status</a> </li>
                            <li class="home">Result</li>
                            <li> <a href="Rules.jsp" >Rules</a> </li>
                            <li> <a href="About.jsp" >About</a> </li>
                            <li> <a href="sponsers.jsp" >Sponsers</a> </li>
                            <li> <a href="Logout" >Logout</a> </li> 
                        </ul>
                    </div> 
                    
                    <% }%>
                </td>
            </tr>        
        </table>
        <div align="center">             
        <table width="810" height="353" border="0">
            <tr >
                <td style="min-width:800px; min-height:600px;">
                    
                    <% String exam_id = (String) session.getAttribute("user");%>
                    
                    <%! Connection cn;
    Statement st;
    ResultSet rs;
    String id = "", college = "";
    int solved, rank = 0;
    Time time;
    java.sql.Date date1;
    int sno = 1;
                    %>
                    
                    <%	try {
                    %>
                    <%				Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            cn = DriverManager.getConnection("jdbc:odbc:sp");
            st = cn.createStatement();

            String query = "Select * from result order by solved desc , date1 asc, LastAcceptTime asc";
            rs = st.executeQuery(query);
                    %>
                    
                    <table border="1" width="800" align="center">  
                        <tr style="background-color: #CCCCCC">
                            <td>
                                <b> Rank </b>
                            </td>
                            <td>
                                <b>Team ID</b>
                            </td>
                            <td>
                                <b>College</b>
                            </td>
                            <td>
                                <b>No. of Problems Solved</b>
                            </td>
                            <td>
                                <b>LastProblemAcceptTime</b>
                            </td>                            
                        </tr>                  
                        
                        <%rank = 0;
            while (rs.next()) {
                        %>
                        <%		id = rs.getString(1);
                            college = rs.getString(2);
                            solved = rs.getInt(3);
                            time = rs.getTime(4);
                            date1 = rs.getDate(5);
                            rank++;
                        %>
                        <tr>
                            <td>
                                <%= rank %>
                            </td>
                            <td>
                                <%=id%>
                            </td>
                            <td>
                                <%if (college == null) {
                                ;
                            } else {%>
                                <%=college%> <%}%> 
                            </td>
                            <td>                                
                                <%=solved%>  
                            </td>
                            <td>
                                <%=date1%><br><%=time%> 
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
        <TABLE width=810 height=5% ALIGN="center" BORDER="0">
            <TR bgcolor="#292929">
                <TD align="center" color=red height=28>
                    <A href="About.jsp" STYLE="color: white;">About Us</A> | 
            <A href="Contact.jsp" STYLE="color: white;">Contact Us </A></TD></TR>
           
        </TABLE>
    </body>
</html>
