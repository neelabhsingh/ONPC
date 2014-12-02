<%-- 
    Document   : adminPage
    Created on : Oct 25, 2009, 8:57:48 PM
    Author     : vishwesh
--%>

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
                    <div id="header">
                        <ul>
                            <li class="home">Home</li>                            
                            <li> <a href="Teams.jsp" >Teams</a></li>                            
                            <li> <a href="Status.jsp" >Status</a></li>
                            <li> <a href="Result.jsp" >Result</a> </li>
                            <li> <a href="Rules.jsp" >Rules</a> </li>
                            <li> <a href="faq.jsp" >FAQ</a> </li>
                            <li> <a href="About.jsp" >About</a> </li>
                            <li> <a href="sponsers.jsp" >Winners</a> </li>
                            <li> <a href="Logout" >Logout</a> </li>                            
                        </ul>
                    </div>                    
                </td>
            </tr>        
        </table>        
        <table width="810" height="353" align="center">
            <tr>
                <td width="588" height="349" style="background-color: #CCCCCC">
                    <center> Welcome Administrator !    </center>
                    <form action="Start" method="get">
                        
                        <p style="color:#9d0000; font-size: 18px;">  Enter no of Problems 
                            <input type="text" name="problems" size="3"><br><br>                            
                        </p>
                        <p style="color:#9d0000; font-size: 18px;">  Choose Language 
                            &nbsp;&nbsp;&nbsp;&nbsp; C &nbsp;<input type="checkbox" name="c">
                            &nbsp;&nbsp;&nbsp;&nbsp; C++ &nbsp;<input type="checkbox" name="cpp">
                            &nbsp;&nbsp;&nbsp;&nbsp; JAVA &nbsp;<input type="checkbox" name="java">
                            &nbsp;&nbsp;&nbsp;&nbsp; C# &nbsp;<input type="checkbox" name="csharp">
                        </p>                        
                        <input type="submit" value="   Next   ">
                    </form>                    
                </td>
                <td width="202" height="349" style="background-color: #C9C9C9">
                    End Exam
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
