<%-- 
    Document   : home
    Created on : 11/10/2017, 23:28:40
    Author     : murilo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.com.fatecpg.connection.BancoUsers"%>
<%@page import="br.com.fatecpg.connection.User"%>
<%@page import="br.com.fatecpg.connection.Quiz"%>
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
        <title>Home</title>
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
        <table border="1">
            <tr><th colspan="2">Ranking</th></tr>
            <tr><th>Nome</th><th>Nota</th></tr>
        <%  double[] notas = new double[BancoUsers.totalUsers()];
            String[] nomes = new String[BancoUsers.totalUsers()];
            for(int i = 0; i < BancoUsers.totalUsers(); i++){
                User user = BancoUsers.getUser(i);
                notas[i] = user.getMediaNota();
                nomes[i] = user.getNome();
            }
            double doubleAux = 0;
            String stringAux;
            for(int i = 0; i < BancoUsers.totalUsers(); i++){
		for(int j = 0; j < BancoUsers.totalUsers() - 1; j++){
                    if(notas[j] < notas[j + 1]){
			doubleAux = notas[j];
			notas[j] = notas[j+1];
			notas[j+1] = doubleAux;
                        
                        stringAux = nomes[j];
                        nomes[j] = nomes[j+1];
                        nomes[j+1] = stringAux;
                    }
		}
            }
            for(int i = 0; i < BancoUsers.totalUsers(); i++){%>
            <tr><td><%=nomes[i]%></td><td><%=notas[i]%></td></tr>
            <%}%>
        </table><br/><br/><br/>
        <table border="1">
            <tr><th colspan="2">Quizzes Efetuados</th></tr>
            <tr><th>Quiz - Nome</th><th>Media de acertos</th></tr>
            <%for(int i = 0; i < BancoUsers.totalQuizzesEfetuados(); i++){
                Quiz quiz = BancoUsers.getQuizEfetuado(i);%>
                <tr><td>Quiz efetuado por: <%=quiz.getUsuarioTestado()%></td><td>Media: <%=quiz.getMedia()%></td></tr>
            <%}%>
        </table>
        <!-- Include Scripts Js -->
        <%@include file="META-INF/jspf/scripts.jspf" %>
        <!-- Ends -->
    </body>
</html>
