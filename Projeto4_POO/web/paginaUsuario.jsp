<%-- 
    Document   : paginaUsuario
    Created on : 14/10/2017, 02:49:52
    Author     : Muca
--%>
<% 
    if(request.getParameter("logoutUsuario") != null){
        session.invalidate();
        response.sendRedirect("home.jsp");
        return;
    }
    if(session.getValue("sessionName") == null){
        response.sendRedirect("home.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Pagina do Usuario</h1>
        <h2>Bem vindo <%=session.getValue("sessionName")%></h2>
        <form>
            <input type="submit" name="logoutUsuario" value="Sair"/>
        </form>
    </body>
</html>
