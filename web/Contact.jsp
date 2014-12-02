<%-- 
    Document   : Contact
    Created on : Oct 25, 2009, 8:44:59 PM
    Author     : vishwesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <link href="style.css" rel="stylesheet" type="text/css" />
        <link href="roundedCorner1.css" rel="stylesheet" type="text/css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ONLINE EXAM</title>
        
        <style>
            .text {
                padding-top:25px; 
                padding-left:50px; 
                padding-bottom : 25px; 
                padding-right:50px;
            }
        </style>        
        
    </head>
    <body>          
        
        
        <table width="800" align="center" border="0">
            <tr bgcolor="#000077">
                <td align="center" style="">
                    <br>
                    <font face="arial" size="8" style="color:white;"><center>
                        <b> ONPC 09 </b>
                    </font>
                    <br>
                    <font face="arial black" size="4" style="color:white;">                        
                        OPTIMISTS INTERNATIONAL PROGRAMMING CONTEST 2009
                    </font>
                    <br>
                    <font face="arial black" size="3" style="color:white;">                        
                        by <br>
                        Department of MCA
                    </font>
                    <br>
                    <font face="sans seriff" size="6" style="color:white;">                        
                        JSS Academy Of Technical Education, Noida
                    </font>
                    
                    <br><br>
                    
                </td>                
            </tr>          
            
            <tr bgcolor="#292929">
                <td height="38" colspan="3">     
                    
                    <%String id = (String) session.getAttribute("user");%>
                    <% if (id == null) {%>
                    <div id="header">
                        <ul>
                            <li> <a href="index.jsp" >Home</a></li>
                            <li> <a href="Teams.jsp" >Teams</a></li>                            
                            <li><a href="Status.jsp" >Status</a> </li>
                            <li> <a href="Result.jsp" >Result</a> </li>                                                        
                            <li> <a href="Rules.jsp" >Rules</a> </li>
                            <li> <a href="About.jsp" >About</a> </li>
                            <li> <a href="faq.jsp" >FAQ</a> </li>
                            <li> <a href="sponsers.jsp" >Sponsers</a> </li>
                        </ul>
                    </div>     
                    <% } else if (id.equals("admin")) {%>
                    <div id="header">
                        <ul>
                            <li> <a href="adminPage.jsp" >Home</a></li>
                            <li> <a href="Teams.jsp" >Teams</a></li>                            
                            <li><a href="Status.jsp" >Status</a> </li>
                            <li> <a href="Result.jsp" >Result</a> </li>
                            <li> <a href="Rules.jsp" >Rules</a> </li>                                                                                   
                            <li> <a href="faq.jsp" >FAQ</a> </li>
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
                            <li> <a href="Result.jsp" >Result</a> </li>
                            <li> <a href="Rules.jsp" >Rules</a> </li>
                            <li> <a href="faq.jsp" >FAQ</a> </li>
                            <li> <a href="About.jsp" >About</a> </li>
                            <li> <a href="sponsers.jsp" >Sponsers</a> </li>
                            <li> <a href="Logout" >Logout</a> </li> 
                        </ul>
                    </div> 
                    
                    <% }%>
                </td>
            </tr>
            <tr>
                <td align="center" class="text" style="font-family:calibri; color:black">
                    
                    <div align="center" class="container" style="text-align:center;">
                        <b class="rtop">
                            <b class="r1"></b> <b class="r2"></b> <b class="r3"></b> <b class="r4"></b>
                        </b>                                                
                        
                        
                        <p style="text-align:center; font-size:20px;">
                            OPTIMISTS <br><BR>                                
                            Department Of MCA <br>
                            JSS Academy Of Technical Education, NOIDA <br> 
                            C-20/1, Sector 62, NOIDA,  <br>
                            UP, INDIA
                        </p>
                        
                        <p style="text-align:left; font-size:18px;">
                            email : <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;optimists@jssaten.ac.in <br> <br>
                            website : <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://www.optimists.org.in">www.optimists.org.in </a>
                        </p>
                        
                        <p style="text-align:center; text-decoration:underline; font-size:20px;">
                            Event Coordinators
                        </p>                    
                        
                        <p style="text-align:left">
                            <p style="text-align:left;">
                                Vishwesh Kumar Yadav <br>
                                <span style="color:black;">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;vishwesh1986@gmail.com <br>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;+91 9971528628
                                </span>
                                <br><br>
                                Ravi Gupta <br>
                                <span style="color:black;">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ravigupta7986@gmail.com <br>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;+91 9891012058
                                </span>
                                <br><br>
                                Vaibhav Paliwal <br>
                                <span style="color:black;">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;vaibhavpaliwal99@gmail.com <br>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;+91 9999560321
                                </span>    
                            </p>
                        </p>
                        <br>
                        
                        <b class="rbottom">
                            <b class="r4"></b> <b class="r3"></b> <b class="r2"></b> <b class="r1"></b>
                        </b>
                    </div>
                    
                    
                </td>
            </tr>
        </table>
        <TABLE width=810 height=5% ALIGN="center" BORDER="0">
            <TR bgcolor="#292929">
                <TD align="center" color=red height=28>
                    <% String id1 = (String) session.getAttribute("user");
            if (id1 != null && id1.equals("admin")) {%>
                    <A href="adminPage.jsp" STYLE="color: white;">Home</A> |
                    
                    <%  } else if (id1 != null) {%> 
                    
                    <A href="home.jsp" STYLE="color: white;">Home</A> |
                    
                    <%
                    } else {%>
                    <A href="index.jsp" STYLE="color: white;">Home</A> | 
                    <% } %>
                    
            <A href="About.jsp" STYLE="color: white;">About Us</A> </TD></TR>
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
