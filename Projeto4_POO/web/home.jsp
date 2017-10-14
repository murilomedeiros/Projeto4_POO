<%-- 
    Document   : home
    Created on : 11/10/2017, 23:28:40
    Author     : murilo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.com.fatecpg.connection.BancoUsers"%>
<%@page import="br.com.fatecpg.connection.User"%>
<%
            if(request.getParameter("trigger") != null){
                String userName = request.getParameter("userName");
                User user = new User(userName, 0);
                if(BancoUsers.addUser(user)){
                    response.sendRedirect("cadastroEfetuado.jsp");
                }
                else{
                    session.putValue("sessionName", userName);
                    response.sendRedirect("paginaUsuario.jsp");
                }
            }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Includes CSS & WoW-->
        <%@include file="META-INF/jspf/link.jspf" %>
        <!-- Ends -->
    </head>
    <body>
        <h1>Hello World!</h1>
        <form method="post">
            <label for="userName">Digite seu nome para login (caso já tenha digitado antes digite-o novamente): </label>
            <input type="text" name="userName" required placeholder="Digite seu nome"/>
            <input type="submit" name="trigger" value="Acessar"/>
        </form>
        <!-- Include Scripts Js -->
        <%@include file="META-INF/jspf/scripts.jspf" %>
        <!-- Ends -->
    </body>
</html>
