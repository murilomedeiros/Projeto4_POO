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
        <link rel='icon' href='resources/img/logo-lion2.png'>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        <link href="resources/css/custom.css" rel="stylesheet" type="text/css"/>
    </head>
    <body id="pagUser">
        <%
            String aux = request.getParameter("q");
            if(aux != null){

        %>
        <script>
            window.onload = function () {
                $("#success-quiz").modal("show");
            };
        </script>
        <%
            }
        %>
        <%@include file="WEB-INF/jspf/nav-bar-restrict.jspf" %>
        <h1 class="textCenter whiteC quiz-title">Área do Usuário</h1>

        <img class="lion left" src="resources/img/coruja_como-fazemos1.png" alt=""/>
        <section class='container-user container-fluid content'>
            <h2 class="textCenter">Bem-vindo</h2><hr class='bottom-line3'><br><br>

            <!-- <form>
             <input type="submit" name="logoutUsuario" value="Sair"/> 
              <input type="submit" name="realizarQuiz" value="Realizar"/>
          </form>-->   
            <div class="content-user row">
                <div class="col-md-3 col-md-offset-3">
                    <h3>Últimos resultados</h3>
                </div>
                <div class="col-md-3">

                    <table class="table table-hover table-responsive">

                        <tr><th>Média</th></tr>
                                <%                                    int c = 1;
                                    for (int i = BancoUsers.totalQuizzesEfetuados() - 1; i >= 0; i--) {
                                        if (c <= 10) {
                                            Quiz quiz = BancoUsers.getQuizEfetuado(i);

                                            if (quiz.getUsuarioTestado().equals(session.getValue("sessionName"))) {
                                %>
                        <tr><td><%=quiz.getMedia()%></td></tr>
                        <%
                                        c++;
                                    }
                                }
                            }
                        %>
                    </table>
                </div>
            </div>
            <%  String color = "black";
                double mediaGeral = BancoUsers.obterMediaUser(String.valueOf(session.getValue("sessionName")));
                if (mediaGeral > 0.0 && mediaGeral <= 5.9) {
                    color = "red";
                }
                if (mediaGeral >= 6.0 && mediaGeral <= 7.9) {
                    color = "yellow";
                }
                if (mediaGeral >= 8.0 && mediaGeral == 10.0) {
                    color = "green";
                }
                if (mediaGeral > 0.0) {
            %>
            <h3 class="textCenter">Sua média de todos os quizzes: <span class="span-media" style="background-color:<%=color%>;"><%=mediaGeral%></span></h3>
                <%} else {%>
            <h3 class="textCenter">Não foi encontrado qualquer quiz realizado, vamos lá tentar fazer um !!!<br><br><a href='quiz.jsp' class="btn btn-colors">Quiz</a></h3>
                <%}%>
        </section>

        <%@include file="WEB-INF/jspf/success-register.jspf" %>
        <%@include file="WEB-INF/jspf/success-quiz.jspf" %>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
        <!-- Jquery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    </body>
</html>
