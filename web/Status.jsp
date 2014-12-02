<%-- 
    Document   : Status
    Created on : Oct 25, 2009, 8:51:58 PM
    Author     : vishwesh
--%>
<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<%@page import="java.text.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                             <li class="home">Status</li>
                            <li><a href="Result.jsp" >Result</a> </li>
                            <li> <a href="Rules.jsp" >Rules</a> </li>
                            <li> <a href="About.jsp" >About</a> </li>
                            <li> <a href="faq.jsp" >FAQ</a> </li>
                            <li> <a href="faq.jsp" >Winners</a> </li>
                        </ul>
                    </div>
                    <% } else if (id.equals("admin")) {%>
                    <div id="header">
                        <ul>
                            <li> <a href="adminPage.jsp" >Home</a></li>
                            <li> <a href="Teams.jsp" >Teams</a></li>                            
                             <li class="home">Status</li>
                            <li><a href="Result.jsp" >Result</a> </li>
                            <li> <a href="Rules.jsp" >Rules</a> </li>
                            <li> <a href="About.jsp" >About</a> </li>
                            <li> <a href="faq.jsp" >FAQ</a> </li>
                            <li> <a href="sponsers.jsp" >Winners</a> </li>
                            <li><a href="Logout" >Logout</a> </li>
                        </ul>
                    </div>                    
                    
                    <% } else {%>
                    <div id="header">
                        <ul>
                            <li> <a href="home.jsp" >Home</a></li>
                            <li> <a href="Teams.jsp" >Teams</a></li>  
                            <li class="home">Status</li>
                            <li><a href="Result.jsp" >Result</a> </li>
                            <li> <a href="Rules.jsp" >Rules</a> </li>
                            <li> <a href="faq.jsp" >FAQ</a> </li>
                            <li> <a href="About.jsp" >About</a> </li>
                            <li> <a href="sponsers.jsp" >Winners</a> </li>
                            <li><a href="Logout" >Logout</a> </li>
                        </ul>
                    </div>   
                    
                    <% }%>
                </td>
            </tr>        
        </table>
        
        <table width="800" height="353" border="0" align="center">
            <tr >
                <td width="800" height="349">
                    
                    <% String exam_id = (String) session.getAttribute("user");%>
                    
                    <%! Connection cn;
    Statement st;
    ResultSet rs;
    String id = "", pname = "", status = "", college = "";
    java.sql.Date date;
    java.sql.Time time;
    String totalmemory = "-";
    String executiontime = "-";
    String lang="";
    int sno = 1;
                    %>
                    
                    <%	try {
                    %>
                    <%				Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            cn = DriverManager.getConnection("jdbc:odbc:sp");
            st = cn.createStatement();

            String query = "Select * from status order by date1 desc, time desc";
            rs = st.executeQuery(query);
                    %>
                    
                    <table border="1" width="800" align="center">  
                        <tr id="header" style="background-color: #CCCCCC">
                            <td align="center">
                                <b>Date</b>
                            </td>
                            <td align="center">
                                <b>Team ID</b>
                            </td>
                            <td align="center">
                                <b>College</b>
                            </td>
                            <td align="center">
                                <b>Problem ID</b>
                            </td>
                            <td align="center">
                                <b>Result</b>
                            </td>
                            <td align="center">
                                <b>Memory</b>                                
                            </td>
                            <td align="center">
                                <b>Time</b>                                
                            </td>
                            <td align="center">
                                <b>Language</b>                                
                            </td>                            
                            
                        </tr>                  
                        
                        <%	sno = 0;
            while (rs.next()) {
                sno++;
                        %>
                        <%		id = rs.getString(1);
                            college = rs.getString(2);
                            pname = rs.getString(3);
                            status = rs.getString(4);
                            date = rs.getDate(7);
                            time = rs.getTime(5);
                            totalmemory = rs.getString(8);
                            executiontime = rs.getString(9);
                            lang = rs.getString(10);

                        %>
                        <%if (status.equalsIgnoreCase("Accepted")) {%>
                        <tr bgcolor="#00bb00">  
                        <%} else if (status.equalsIgnoreCase("Wrong Answer")) {%>
                        <tr bgcolor="#fa9500">
                        <% } else if (status.equalsIgnoreCase("Run Time Error")) {%> 
                        <tr bgcolor="#d07c00">
                        <% } else if (status.equalsIgnoreCase("Compilation Error")) {%> 
                        <tr bgcolor="#fa9500">
                        <% } else {%> 
                        <tr bgcolor="#fa9500">
                            <% }%>
                            
                            <td align="center">
                                <%if (date == null) {
                                ;
                            } else {%>
                                <%=date%> <br> <%=time%> <%}%> 
                            </td>                            
                            <td align="center">
                                <%=id%>
                            </td>
                            <td align="center">
                                <%=college%>  
                            </td>
                            <td align="center">
                                <%=pname%> 
                            </td>
                            <td align="center">
                                
                                <%=status%>  
                            </td>
                            <td align="center">
                                <%=totalmemory%> &nbsp;MB 
                            </td>
                            <td align="center">
                                <%=executiontime%> &nbsp; sec.  
                            </td>
                             <td align="center">
                                <%if(lang.equals("c")) { %>
                                C
                                <%   } else if (lang.equals("cpp")) { %>
                                C++
                                <%   } else if (lang.equals("java")) { %>
                                JAVA
                                <%   } else if (lang.equals("csharp")) { %>
                                C#
                                <%   }%>
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
