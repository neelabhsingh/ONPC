<%-- 
    Document   : index
    Created on : Oct 25, 2009, 8:34:39 PM
    Author     : vishwesh
--%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

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
                            <li> <a href="About.jsp" >About</a> </li>
                            <li> <a href="faq.jsp" >FAQ</a> </li>
                            <li> <a href="sponsers.jsp" >Winners</a> </li>
                        </ul>
                    </div>                    
                </td>
            </tr>        
        </table>
        <div align="center">           
            <table cellpadding="0" cellspacing="0" width="800" height="353" border="0">
                <tr>
                    <td align="center" valign="top" width="600" height="349" style="font-family:'comic sans ms'; font-size:20px; color: #9d0000;">
                        
                        <br>
                        
                        <font style="color:red; font-size:30px;">
                            <marquee> 8 days to ONLINE WAR OF CODERS....    </marquee>
                        </font>
                        
                        <br>
                        <b>
                            <div class="abstract" style="text-align:left; color:#0000cc; font-size:20px;">
                                "I speak Hindi to God, English to men, Italian to women,  and German to my horse", <br>		
                            </div>
                            
                            <div class="abstract" style="text-align:left; color:#0000CC; font-size:20px;">
                                Mmmmh... What about U? C, C++ or Java ? 
                            </div>
                        </b>
                        <br>
                        
                        <div class="abstract" style="font-family:verdana; text-align:justify; color:black; font-size:16px;">
                            
                           
                            <br><br>
                            We are providing an online platform where you can test your programming acumen and showcase your caliber by unlocking some of the most challenging problems and racing against other coders.
                            <br><br>
                            To do this you just need to have an editor, a browser(we prefer firefox) and ofcourse INTERNET CONNECTION.
                            
                        </div>
                        
                        
                        
                    </td>
                    <td align="center" width="200" style="">                        
                        
                        
                        
                        
                        
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
                            
                            <b class="rbottom">
                                <b class="r4"></b> <b class="r3"></b> <b class="r2"></b> <b class="r1"></b>
                            </b>
                        </div>
                        
                        <br>
                        
                        
                        
                        
                        
                    </td>              
                </tr>
            </table>             
        </div>
        <TABLE width=800 height=5% ALIGN="center" BORDER="0">
            <TR bgcolor="#292929">
                <TD align="center" color=red height=28>
                    <A href="About.jsp" STYLE="color: white;">About Us</A> | 
            <A href="Contact.jsp" STYLE="color: white;">Contact Us </A></TD></TR>
            
        </TABLE>
        
        <script type="text/javascript">
            var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
            document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
        </script>
        <script type="text/javascript">
            try {
                var pageTracker = _gat._getTracker("UA-11038874-2");
                pageTracker._trackPageview();
            } catch(err) {}
        </script>        
        
    </body>
</html>
