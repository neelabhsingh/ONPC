<%-- 
    Document   : About
    Created on : Oct 25, 2009, 8:43:08 PM
    Author     : vishwesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <link href="style.css" rel="stylesheet" type="text/css" />
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
        
        
        <table STYLE="width:800px;" align="center" border="0" >
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
                <td height="38">     
                    
                    <%String id = (String) session.getAttribute("user");%>
                    <% if (id == null) {%>
                    <div id="header">
                        <ul>
                            <li> <a href="index.jsp" >Home</a></li>
                            <li> <a href="Teams.jsp" >Teams</a></li>                            
                            <li><a href="Status.jsp" >Status</a> </li>
                            <li> <a href="Result.jsp" >Result</a> </li>                                                        
                            <li> <a href="Rules.jsp" >Rules</a> </li>
                            <li> <a href="faq.jsp" >FAQ</a> </li>
                            <li class="home">About</li>
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
                            <li class="home">About</li>
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
                            <li class="home">About</li>
                            <li> <a href="sponsers.jsp" >Sponsers</a> </li>
                            <li> <a href="Logout" >Logout</a> </li> 
                        </ul>
                    </div> 
                    
                    <% }%>
                </td>
            </tr>     
            <tr>                
                <td align="left" class="text">
                    
                    <dl>
                        <dt style="font-family:arial black;">OPTIMISTS</dt>
                        <dd style="text-align:justify; font-family:calibri; color:BLACK;">
                            OPTIMISTS  is the students society of <b>MCA in
                            JSS Academy of Technical Education, Noida</b>.
                            It is a student's society that works for students.
                            It supports students to cope up with rapidly changing
                            trends and technologies in IT world.
                            <br><br>
                            <span style="color:black">website :</span> <a href="http://optimists.org.in/"> http://optimists.org.in/ </a>
                        </dd>
                        
                        <dt style="font-family:arial black;"><br>JSS Academy Of Technical Education, NOIDA</dt>
                        <dd style="text-align:justify; font-family:calibri; color:BLACK;">
                            JSSATE, NOIDA ranked as one of the best Technical
                            Institutions in the state of Uttar Pradesh is a 
                            value-based Centre of Excellence in Technical Education.
                            <br><br>
                            <span style="color:black">website :</span> <a href="http://www.jssaten.ac.in/"> http://www.jssaten.ac.in/ </a>
                            <br><br>
                             JSSATE NOIDA is one of the Technical Institutes form the
                             Jagadguru Sri Shivarathreeswara Mahavidyapeetha,
                             established in 1954. It is a central body, which 
                             runs more than 300 Institutions, located in Karnataka,
                             Tamil Nadu, Kerala and Uttar Pradesh.
                            <br><br>
                            <span style="color:black">website :</span> <a href="http://www.jssaten.ac.in/jssmaha.html"> http://www.jssaten.ac.in/jssmaha.html </a>
                             
                        </dd>
                    </dl> 
                </td>
            </tr>
        </table>
        <TABLE cellpadding="0" cellspacing="0" STYLE="width:800px;" height=5% ALIGN="center" BORDER="0">
            <TR bgcolor="#292929">
                <TD align="center" color=red height=28>
                    <% String id1 = (String) session.getAttribute("user");
            if (id1 != null && id1.equals("admin")) {%>
                    <A href="adminPage.jsp" STYLE="color: white;">Home</A> |
                    
                    <%  } else if (id1 != null) {%> 
                    
                    <A href="home.jsp" STYLE="color: white;">Home</A>  |
                    
                    <%
                    } else {%>
                    <A href="index.jsp" STYLE="color: white;">Home</A> | 
                    <% } %>
                    
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
