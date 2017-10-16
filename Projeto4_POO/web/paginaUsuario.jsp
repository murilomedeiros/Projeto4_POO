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
        <title>Área do Usuário - <%= session.getValue("sessionName")%></title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        <link href="resources/css/custom.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/nav-bar.jspf" %>
        <h1 class="textCenter whiteC quiz-title">Área do Usuário</h1>
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
                        for (int i = BancoUsers.totalQuizzesEfetuados() - 1; i >= 0; i--) {
                            if (c <= 10) {
                                Quiz quiz = BancoUsers.getQuizEfetuado(i);

                                if (quiz.getUsuarioTestado().equals(session.getValue("sessionName"))) {%>
            <tr><td><%=quiz.getMedia()%></td></tr>
            <%c++;
                                }
                            }%>
            <%}%>
        </table>
        <%@include file="WEB-INF/jspf/success-register.jspf" %>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
        <!-- Jquery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    </body>
</html>
