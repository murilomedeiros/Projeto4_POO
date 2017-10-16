<%-- 
    Document   : paginaUsuario
    Created on : 14/10/2017, 02:49:52
    Author     : Muca
--%>
<%@page import="br.com.fatecpg.connection.Quiz"%>
<%@page import="br.com.fatecpg.connection.User"%>
<%@page import="br.com.fatecpg.connection.BancoUsers"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home - <%= session.getValue("sessionName")%></title>
        <!-- Includes CSS & WoW-->
        <%@include file="WEB-INF/jspf/link.jspf" %>
        <!-- Ends -->
    </head>
    <body>
        <h1>Pagina do Usuario</h1>
        <h2>Bem vindo <%=session.getValue("sessionName")%></h2>
        <h3>Sua média: </h3>
        <form>
            <input type="submit" name="logoutUsuario" value="Sair"/>
            <input type="submit" name="realizarQuiz" value="Realizar"/>
        </form>
        <table border="1">
            <tr><th colspan="2">Ranking pessoal</th></tr>
            <tr><th>Nome</th><th>Nota</th></tr>
            
        </table><br/><br/><br/>
        <table border="1">
            <tr><th colspan="2">Meus ultimos quizzes Efetuados</th></tr>
            <tr><th> - </th><th>Media de acertos</th></tr>
            
        </table>
        <!-- Include Scripts Js -->
        <%@include file="WEB-INF/jspf/scripts.jspf" %>
        <!-- Ends -->
    </body>
</html>
