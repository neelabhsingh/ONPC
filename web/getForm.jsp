<%-- 
    Document   : getForm
    Created on : Oct 27, 2009, 9:37:17 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
            String q = request.getParameter("q");
        %>
        
        <%
            if (q.equals("login")) {
                out.println(                        
                        "<form method=\"get\" action=\"LoginCheck\">" +
                        "<img alt=\"user id : \" src=\"user.jpg\" style=\"width:20px; height:20px;\">" +
                        "<input name=\"login\" type=\"text\" size=\"13\" maxlength=\"20\">" +
                        "<br>" +
                        "<img alt=\"password : \" src=\"password.jpg\">" +
                        "<input name=\"key\" type=\"password\" size=\"15\" maxlength=\"10\">" +
                        "<br>" +
                        "<br>" +
                        "<input type=\"submit\" name=\"submit\" value=\" Login \">" +                        
                        "</form>" + 
                        "<span style=\"font-size:15px;\" onclick=\"getForm('hide')\"><br>hide</span>");
            } else if (q.equals("hide")){
                out.println("<span class=\"style9\"><label onclick=\"getForm('login')\">Login</label></span>");
            }
        %>
    </body>
</html>
