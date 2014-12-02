<%-- 
    Document   : Rules
    Created on : Oct 25, 2009, 8:48:13 PM
    Author     : vishwesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <link href="style.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" type="text/css" href="roundedCorner1.css">
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Online Programming Judge</title>
        <script type="text/javascript" src="form.js"></script>
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
            .text {
                padding-top:25px; 
                padding-left:50px; 
                padding-bottom : 25px; 
                padding-right:50px;
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
                    
                    <%
                    String id = (String) session.getAttribute("user");                    
                    int i=800;
                    %>
                    <% 
                    if (id == null) {
                        i=600;
                        %>
                    
                    <div id="header">
                        <ul>
                            <li> <a href="index.jsp" >Home</a></li>
                            <li> <a href="Teams.jsp" >Teams</a></li>                            
                            <li><a href="Status.jsp" >Status</a> </li>
                            <li> <a href="Result.jsp" >Result</a> </li>
                            <li class="home">Rules</li>
                            <li> <a href="faq.jsp" >FAQ</a> </li>
                            <li> <a href="About.jsp" >About</a> </li>
                            <li> <a href="sponsers.jsp" >Winners</a> </li>
                        </ul>
                    </div> 
                    
                    <% 
                    } else if (id.equals("admin")) {
                        i=600;
                        %>
                    <div id="header">
                        <ul>
                            <li> <a href="adminPage.jsp" >Home</a></li>
                            <li> <a href="Teams.jsp" >Teams</a></li>                            
                            <li><a href="Status.jsp" >Status</a> </li>
                            <li> <a href="Result.jsp" >Result</a> </li>
                            <li class="home">Rules</li>
                            <li> <a href="faq.jsp" >FAQ</a> </li>
                            <li> <a href="About.jsp" >About</a> </li>
                            <li> <a href="sponsers.jsp" >Sponsers</a> </li>
                            <li> <a href="Logout" >Logout</a> </li> 
                        </ul>
                    </div>  
                    
                    <% 
                    } else {
                        i=600;
                        %>
                    <div id="header">
                        <ul>
                            <li> <a href="home.jsp">Home</a></li>
                            <li> <a href="Teams.jsp" >Teams</a></li>                            
                            <li><a href="Status.jsp" >Status</a> </li>
                            <li> <a href="Result.jsp" >Result</a> </li>
                            <li class="home">Rules</li>
                            <li> <a href="faq.jsp" >FAQ</a> </li>
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
            <table width="805" height="353" border="0">
                <tr >
                    <td align="left" width="<%=i%>" height="349">
                        
                        <div align="left" class="text" style="color: #9d0000;">
                            
                            <div align="center" style="font-size:25px;"> Rules </div>
                            <hr>
                            
                            <div align="left" style="font-size:20px;"> A. The Team </div>
                            
                            <div align="left">
                                <ol style="color:black; font-family:aerial; font-size:15px;">
                                    <li onmouseover="this.style.color='red'" onmouseout="this.style.color='black'"> Contest is open to all. </li>
                                    <li onmouseover="this.style.color='red'" onmouseout="this.style.color='black'"> Maximum of 2 members in a team are allowed. One person can't be part of more than one team. </li>
                                    <li onmouseover="this.style.color='red'" onmouseout="this.style.color='black'"> To participate you have to <a href="register.jsp"> register first </a>. </li>
                                </ol>
                            </div>
                            
                            <div align="left" style="font-size:20px;"> B. Technical </div>
                            
                            <ol style="color:black; font-family:aerial; font-size:15px;">
                                <li onmouseover="this.style.color='red'" onmouseout="this.style.color='black'"> Languages allowed are C, C++ and Java. You are provided with facility to choose any of these languages to individual problems. </li>                                
                                <li onmouseover="this.style.color='red'" onmouseout="this.style.color='black'"> For all the problems, input should be read from stdin and output should be written to stdout. </li>
                                <li onmouseover="this.style.color='red'" onmouseout="this.style.color='black'"> No system calls will be allowed, other than reading from stdin and writing to stdout. </li>
                                <li onmouseover="this.style.color='red'" onmouseout="this.style.color='black'"> Maximum of 10 submissions will be allowed for a problem. </li>
                            </ol>
                            
                            <div align="left" style="font-size:20px;"> C. Malicious Activities </div>
                            
                            <ol style="color:black; font-family:aerial; font-size:15px;">
                                <li onmouseover="this.style.color='red'" onmouseout="this.style.color='black'"> Administrators have the authority to suspend/disqualify any team at any stage of the contest, if they suspect any malpractices/plagiarism. </li>
                                <li onmouseover="this.style.color='red'" onmouseout="this.style.color='black'"> Any sort of malicious activity will lead to immediate disqualification of the concerned team. </li>
                            </ol>
                            
                        </div>                
                        
                    </td>

<% if (id == null) {%>                        

                    <td align="center" width="200" style="">                        
                        <br>
                        

                        
                        
                        <div align="center" class="container" style="overflow:auto; max-height:400px; text-align:center; color:red;">
                            <b class="rtop">
                                <b class="r1"></b> <b class="r2"></b> <b class="r3"></b> <b class="r4"></b>
                            </b>                                                
                            
                            
                            
                            
                            <form method="post" action="LoginCheck">
                                <table>
                                    <tr>
                                        <td valign="middle">
                                            <img alt="userid" src="user2.jpg" style="width:25px; height:25px;" title="userid">
                                        </td>
                                        <td valign="middle">
                                            <input name="login" type="text" size="15" maxlength="20" title="userid">                               
                                        </td>
                                    </tr>
                                    <tr>
                                        
                                        <td valign="middle">
                                            <img alt="userid" src="password.jpg" style="width:25px; height:25px;" title="password">
                                        </td>
                                        <td valign="middle">
                                            <input name="key" type="password" size="15" maxlength="10" title="password">
                                        </td>
                                    </tr>
                                    <tr><td align="center" colspan="2"> <input type="submit" name="submit" value=" Login"> </td></tr>
                                </table>
                            </form>
                            
                            <hr style="color:red; width:100px;">                            
                            
                            <span class="style9"><a href="register.jsp" onmouseover="this.style.color='red'" onmouseout="this.style.color='#0000ff'" style="font-size:15px; color:#0000cc">New User!! Register Now.</a></span>
                            
                            <br>
                            
                            <b class="rbottom">
                                <b class="r4"></b> <b class="r3"></b> <b class="r2"></b> <b class="r1"></b>
                            </b>
                        </div>                        
                        
                        
                        <br><br><br><br><br><br><br><br><br><br><br><br><br>
                        
                    </td>
<%}%>                    
                </tr>
            </table>             
        </div>
        <TABLE width=805 height=5% ALIGN="center" BORDER="0">
            <TR bgcolor="#292929">
                <TD align="center" color=red height=28>
                    <A href="About.jsp" STYLE="color: white;">About Us</A> | 
            <A href="Contact.jsp" STYLE="color: white;">Contact Us </A></TD></TR>
            
        </TABLE>
    </body>
</html>
