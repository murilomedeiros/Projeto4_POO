<%-- 
    Document   : quiz
    Created on : 13/10/2017, 23:41:01
    Author     : murilo
--%>
<%@page import="br.com.fatecpg.connection.BancoUsers"%>
<%@page import="br.com.fatecpg.connection.User"%>
<%@page import="br.com.fatecpg.connection.Quiz"%>
<%@page import="br.com.fatecpg.connection.Questao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quiz</title>
        <link rel='icon' href='resources/img/logo-lion2.png'>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        <link href="resources/css/custom.css" rel="stylesheet" type="text/css"/>
    </head>
    <body id="pagQuiz">
        <%@include file="WEB-INF/jspf/nav-bar-restrict.jspf" %>
        <h1 class="textCenter whiteC quiz-title">Quiz</h1>
        <%            if (session.getValue("sessionName") == null) {
                response.sendRedirect("home.jsp");
            }
            if (request.getParameter("finalizar") != null) {
                int acertos = 0;
                for (Questao q : Quiz.getQuestoes()) {
                    String resposta = request.getParameter(q.getPergunta());
                    if (resposta != null) {
                        if (resposta.equals(q.getResposta())) {
                            acertos++;
                        }
                    }
                }
                Quiz quiz = new Quiz(10, acertos, String.valueOf(session.getValue("sessionName")));
                BancoUsers.addQuizEfetuado(quiz);
                BancoUsers.atualizarMediaUser(String.valueOf(session.getValue("sessionName")), acertos);
                response.sendRedirect(request.getContextPath() + "/paginaUsuario.jsp?q=d");
            }
        %>
        <div class="form-quiz ">
            <form>
                <h2 class="textCenter">Questões</h2><br><br>
                <% int x = 1;
                    for (Questao q : Quiz.getQuestoes()) {%>
                <div class="row-radio">
                    <h4><%=x + ". " + q.getPergunta()%></h4>
                    <div class="radio-place">
                        <input type="radio" class="radio-button" required name="<%=q.getPergunta()%>"
                               value="<%=q.getAlternativas()[0]%>"/>
                        <%=q.getAlternativas()[0]%><br/>
                        <input type="radio" class="radio-button2" required  name="<%=q.getPergunta()%>"
                               value="<%=q.getAlternativas()[1]%>"/>
                        <%=q.getAlternativas()[1]%><br/>
                        <input type="radio" class="radio-button2" required  name="<%=q.getPergunta()%>"
                               value="<%=q.getAlternativas()[2]%>"/>
                        <%=q.getAlternativas()[2]%>
                    </div>
                    <hr>
                </div>
                <%x++;
                        }%>

                <br/><br/>
                <input type="hidden" name="usuarioTestado" value="<%=String.valueOf(session.getValue("sessionName"))%>"/>
                <h5 class="textCenter"><input class="btn btn-colors " type="submit" name="finalizar" value="Finalizar"/></h5>
            </form>
        </div>
        <%@include file="WEB-INF/jspf/success-register.jspf" %>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
        <!-- Jquery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    </body>
</html>
