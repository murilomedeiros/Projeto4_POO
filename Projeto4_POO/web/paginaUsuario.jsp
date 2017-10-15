<%-- 
    Document   : paginaUsuario
    Created on : 14/10/2017, 02:49:52
    Author     : Muca
--%>
<%@page import="br.com.fatecpg.connection.Quiz"%>
<%@page import="br.com.fatecpg.connection.User"%>
<%@page import="br.com.fatecpg.connection.BancoUsers"%>
<% 
    if(request.getParameter("logoutUsuario") != null){
        session.invalidate();
        response.sendRedirect("home.jsp");
        return;
    }
    if(session.getValue("sessionName") == null){
        response.sendRedirect("home.jsp");
    }
    if(request.getParameter("realizarQuiz") != null){
        response.sendRedirect("quiz.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home - <%= session.getValue("sessionName")%></title>
        <!-- Includes CSS & WoW-->
        <%@include file="META-INF/jspf/link.jspf" %>
        <!-- Ends -->
    </head>
    <body>
        <h1>Pagina do Usuario</h1>
        <h2>Bem vindo <%=session.getValue("sessionName")%></h2>
        <h3>Sua média de todos os quizzes: <%=BancoUsers.obterMediaUser(String.valueOf(session.getValue("sessionName")))%></h3>
        <form>
            <input type="submit" name="logoutUsuario" value="Sair"/>
            <input type="submit" name="realizarQuiz" value="Realizar"/>
        </form>
        <table border="1">
            <tr><th colspan="2">Meus ultimos quizzes Efetuados</th></tr>
            <tr><th>Média</th></tr>
            <%  
                int c = 1;
                for(int i = BancoUsers.totalQuizzesEfetuados() - 1; i >= 0; i--){
                    if(c <= 10){
                        Quiz quiz = BancoUsers.getQuizEfetuado(i);

                        if(quiz.getUsuarioTestado().equals(session.getValue("sessionName"))){ %>
                            <tr><td><%=quiz.getMedia()%></td></tr>
                        <%c++;
                        }
                    }%>
            <%}%>
        </table>
        <!-- Include Scripts Js -->
        <%@include file="META-INF/jspf/scripts.jspf" %>
        <!-- Ends -->
    </body>
</html>
