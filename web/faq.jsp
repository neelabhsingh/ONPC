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
                            <li class="home"> FAQ </li>
                            <li> <a href="About.jsp" >About</a> </li>                            
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
                            <li> <a href="sponsers.jsp" >Winners</a> </li>
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
                            <li> <a href="sponsers.jsp" >Winners</a> </li>
                            <li> <a href="Logout" >Logout</a> </li> 
                        </ul>
                    </div> 
                    
                    <% }%>
                </td>
            </tr>
            <tr>
                <td align="left" class="text" style="font-family:calibri; font-size:18px; color:black">                    
                    
                    <ol>
                        <li>
                            How can I participate in this event?<br>
                            <b><u>Ans.</u></b> <span style="font-size:16px;"> Its an online event and so you have to just register at our website and then login there to participate. After login you will get links to download/view problems and an interface to submit solutions.</span><br><br>
                            
                        </li>
                        
                        <li>
                            I am a passout, can I also participate?<br>
                            <b><u>Ans.</u></b> <span style="font-size:16px;"> YES U can. In that case you may place name of your previous institute or the current organisation in registration form.</span><br><br>
                            
                        </li>
                        
                        <li>
                            Do I have to pay something for registration?<br>
                            <b><u>Ans.</u></b> <span style="font-size:16px;"> NO, registrations and participation are free of cost.</span><br><br>
                            
                        </li>
                        
                        <li>
                            How many teams will get prizes?<br>
                            <b><u>Ans.</u></b> <span style="font-size:16px;"> Top 10 teams will be given prizes.</span><br><br>
                            
                        </li>
                        
                        <li>
                            What's the criteria for winning?<br>
                            <b><u>Ans.</u></b> <span style="font-size:16px;"> Team solving MAX. number of problems will be the winner. In case of tie, last accept time will be the deciding factor. Refer to RULES for more.</span><br><br>
                            
                        </li>
                        
                        <li>
                            Which compiler I should use?<br>
                            <b><u>Ans.</u></b> <span style="font-size:16px;"> We recommend gcc-4.3.3 for C and C++ and JDK1.6 for java</span><br><br>
                            
                        </li>
                        
                        <li>                            
                            How much time I will get in main event?<br>
                            <b><u>Ans.</u></b> <span style="font-size:16px;"> 4hrs. but can be extended.</span><br><br>
                        </li>
                        
                        <li>
                            Do the main event will be exactly same to practice rounds?<br>
                            <b><u>Ans.</u></b> <span style="font-size:16px;"> YES. The change will be only in problems and time alloted.</span><br><br>
                            
                        </li>
                    </ol>                    

                    
                    For any other query send mail at <B>optimists@jssaten.ac.in</B>
                    
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
                    
                    <A href="Contact.jsp" STYLE="color: white;">Contact Us</A>
                </TD>
            </TR>
            
        </TABLE>
    </body>
</html>
