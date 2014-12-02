<%-- 
    Document   : home
    Created on : Oct 25, 2009, 10:33:50 PM
    Author     : vishwesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <link href="style.css" rel="stylesheet" type="text/css" />
        <link href="roundedCorner1.css" rel="stylesheet" type="text/css"/>
        
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
            .style6 {
                color: #FF0000;
                font-weight: bold;
                font-family: "Times New Roman", Times, serif;
                font-size: 18px;
            }
            .style7 {
                color: #9d0000;
                font-weight: bold;
                font-family: "Times New Roman", Times, serif;
                font-size: 18px;
            }         
        </style>        
    </head>    
    <body>
        
        <SCRIPT language="JavaScript">
            
            function validate() {                
                if( document.form1.upload.value=="") {                    
                    alert("Please Choose file to be Uploaded i.e. source-code file");
                    return;
                }                
                document.form1.action="Upload";
                document.form1.submit();                                                
            }
            
        </SCRIPT>
        
        
        <table width="800" align="center" border="0" >
            <tr bgcolor="#000077">
                <td height="120">
                    <br>
                    <font face="arial" size="8" style="color:white;"><center>
                        <b> ONPC 09 </b>
                    </font>
                    <br>
                    <font face="arial black" size="4" style="color:white;">                        
                        OPTIMISTS INTERNATIONAL PROGRAMMING CONTEST 2009
                    </font>
                    <br><br>
                    <font face="sans seriff" size="6" style="color:white;">                        
                        JSS Academy Of Technical Education, Noida
                    </font>
                    
                    <br><br>
                    
                </td>                
            </tr>            
            <tr bgcolor="#292929">
                <td height="38">
                    <div id="header">
                        <ul>
                            <li class="home">Home</li>
                            <li> <a href="Teams.jsp" >Teams</a></li>
                            <li><a href="Status.jsp" >Status</a> </li>
                            <li><a href="Result.jsp" >Result</a> </li>
                            <li> <a href="Rules.jsp" >Rules</a> </li>
                            <li> <a href="faq.jsp" >FAQ</a> </li>
                            <li> <a href="About.jsp" >About</a> </li>
                            <li> <a href="sponsers.jsp" >Sponsers</a> </li>
                            <li> <a href="Logout" >Logout</a></li>
                        </ul>
                    </div>
                </td>
            </tr>        
        </table>                  
        
        <%!
    boolean flag = false;
        %>
        
        <% String user = (String) session.getAttribute("user");%>
        
        
        <table width="800" height="353" align="center" border="0">
            <tr >
                <td width="588" height="349" align="center" valign="top">
                    <%
            if (user == null) {%>
                    <script type="text/javascript">
                        alert("Unauthirised Access");
                        location.href="index.jsp";
                    </script>                     
                    
                    <% } else {%>
                    
                    <p class="style7"> Welcome &nbsp; <%= user %> ! </p>
                    
                    
                    <%!String uploadVar = "";%>
                                        
                    
                    <%-- finding no of problems --%>
                    
                    <%
                        int totalProblems = 0;
                        try {
                            Connection cn;
                            Statement st;
                            ResultSet rs;
                            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

                            cn = DriverManager.getConnection("jdbc:odbc:sp");

                            st = cn.createStatement();

                            String q = "select * from exam_config";

                            rs = st.executeQuery(q);
                            rs.next();
                            totalProblems = rs.getInt(2);

                            cn.close();

                        } catch (Exception e) {
                            out.println(e);
                        }
                    %>
                    
                    <%-- Language Selection --%>
                    
                    <%
                        boolean c = false, cpp = false, java = false, csharp = false;
                        try {
                            Connection cn;
                            Statement st;
                            ResultSet rs;
                            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

                            cn = DriverManager.getConnection("jdbc:odbc:sp");

                            st = cn.createStatement();

                            String q = "select * from exam_config";

                            rs = st.executeQuery(q);

                            rs.next();
                            c = rs.getBoolean(3);
                            cpp = rs.getBoolean(4);
                            java = rs.getBoolean(5);
                            csharp = rs.getBoolean(6);

                            cn.close();

                        } catch (Exception e) {
                            out.println(e);
                        }
                    %>
                    
                    
                    <div class="container" style="overflow:auto; max-height:400px; text-align:center; color:red;">
                        <b class="rtop">
                            <b class="r1"></b> <b class="r2"></b> <b class="r3"></b> <b class="r4"></b>
                        </b>                                                
                        
                        <br>                        
                        
                        <FORM ENCTYPE="multipart/form-data" METHOD="POST" NAME="form1">                  
                            <b>Select Problem ID :</b> &nbsp;&nbsp;                       
                            <select name="pid" >
                                <%   for (int i = 1; i <= totalProblems; ++i) {%>
                                
                                <option value="<%=i%>">&nbsp;&nbsp;  Problem <%=i%> &nbsp;&nbsp;</option>  
                                
                                <% }%>
                                
                                
                            </select>
                            <br><br><br>                        
                            <b>Select Language :</b> &nbsp;&nbsp;                       
                            <select name="lang" >
                                <%   if (c) {%>
                                
                                <option value="c     ">&nbsp;&nbsp;  C &nbsp;&nbsp;</option>  
                                
                                <% }%>
                                
                                <%   if (cpp) {%>
                                
                                <option value="cpp   ">&nbsp;&nbsp;  C++ &nbsp;&nbsp;</option>  
                                
                                <% }%>
                                
                                <%   if (java) {%>
                                
                                <option value="java  ">&nbsp;&nbsp;  JAVA &nbsp;&nbsp;</option>  
                                
                                <% }%>
                                
                                <%   if (csharp) {%>
                                
                                <option value="csharp">&nbsp;&nbsp;  C# &nbsp;&nbsp;</option>  
                                
                                <% } %>
                                
                            </select>
                            <br><br><br>                        
                            
                            <INPUT TYPE="File" name="upload" SIZE="40"><br><br>
                            <INPUT TYPE="submit" value="Upload"  onclick="validate()"><br>
                        </FORM>
                        
                        <br>
                        
                        <b class="rbottom">
                            <b class="r4"></b> <b class="r3"></b> <b class="r2"></b> <b class="r1"></b>
                        </b>
                    </div>
                    
                    
                    <% }%>
                    
                </td>
                <td width="202" align="center">                                        
                    
                    <label class="style7"> Download Problems </label> <br><br>
                    
                    <div class="container" style="overflow:auto; max-height:400px; text-align:center; color:red;">
                        <b class="rtop">
                            <b class="r1"></b> <b class="r2"></b> <b class="r3"></b> <b class="r4"></b>
                        </b>                                                
                        
                        
                        
                        <% if (user != null) {%>
                        
                        
                        <a href="/questions.zip" target="new page" style="font-family:comic sans ms; color:red;">ZIP format</a><br><br>
                        <a href="/questions.pdf" target="new page" style="font-family:comic sans ms; color:red;">Pdf format</a>                                                           
                        
                        <% }%>
                        
                        <b class="rbottom">
                            <b class="r4"></b> <b class="r3"></b> <b class="r2"></b> <b class="r1"></b>
                        </b>
                    </div>
                    
                    <br>
                    
                    <label class="style7" style="font-size:16px;"> Problems U solved till now  </label> <br><br>
                    
                    <div class="container" style="text-align:left; color:blue;">
                        <b class="rtop">
                            <b class="r1"></b> <b class="r2"></b> <b class="r3"></b> <b class="r4"></b>
                        </b>                                                
                       
                        
                        <b class="rbottom">
                            <b class="r4"></b> <b class="r3"></b> <b class="r2"></b> <b class="r1"></b>
                        </b>
                    </div>
                    
                    
                    <br><br><br>
                    
                </td>              
            </tr>
        </table>    
        <TABLE width=800 height=5% ALIGN="center" BORDER="0">
            <TR bgcolor="#292929">
                <TD align="center" color=red height=28>
                    <A href="About.jsp" STYLE="color: white;">About Us</A> | 
            <A href="Contact.jsp" STYLE="color: white;">Contact Us </A></TD></TR>
            <TR bgcolor="#000077">
                <TD align="center" height=21>
                    <span style="color:white;">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Copyright  2007-2015 <a STYLE="color:white; href="http://www.vishwesh.in/">vishwesh.in</a> All Rights Reserved - OPTIMISTS<br>Web Developer &amp; Designer 
                        - <A TARGET="_blank" STYLE="color:white;" href="http://optimists.org.in/resume/vishwesh.pdf"> Vishwesh Kumar Yadav<a>&nbsp;|&nbsp;<A STYLE="color:white;" TARGET="_blank" href="http://optimists.org.in/resume/ravi.pdf">Ravi Gupta</A>&nbsp;|&nbsp;<A STYLE="color:white;" TARGET="_blank" href="http://optimists.org.in/resume/vaibhav.pdf">Vaibhav Paliwal</A>
                    </span>
                </TD>
            </TR>
        </TABLE>
    </body>
</html>
