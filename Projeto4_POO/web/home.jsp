<%-- 
    Document   : home
    Created on : 11/10/2017, 23:28:40
    Author     : murilo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.com.fatecpg.connection.BancoUsers"%>
<%@page import="br.com.fatecpg.connection.User"%>
<%@page import="br.com.fatecpg.connection.Quiz"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home - Quiz Wild</title>
        <link rel='icon' href='resources/img/logo-lion.png'>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        <link href="resources/css/custom.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/nav-bar.jspf" %>
        <div class="top-title">
            <h1>Quiz Wild</h1> 
            <div class="right">
                <div class="speech-bubble">Venha se divertir com nosso quiz !!</div>
                <img src="https://d134jvmqfdbkyi.cloudfront.net/8362af37/images/deadlyduck/illustrations/questionmarks.svg" alt="" class="questionmarks hide-for-small-only">
                <img class="lion" src="resources/img/leão.png" alt=""/>
            </div>
            <div>

                <form id="form-login" class="navbar-form" method="post"> 
                    <p>Quiz composto por vários tipos de perguntas sobre o mundo animal.</p><br>


                    <%                        if (session.getAttribute("email") == null) {
                    %>
                    <div class="form-group">
                        <input id="register-input" class="form-control" type="email" name="userName" required placeholder="Digite seu email"/>
                    </div>
                    <input  id="enter" type="submit" class="btn btn-colors2" name="trigger" value="Cadastre-se"/>
                    <%
                    } else {%>
                    <br><br>
                    <%}
                    %>

                </form>
            </div>
        </div>
        <section id="ranking" class="container-fluid content" >

            <img class="birds" src="resources/img/birds.png" alt=""/>
            <div class="row">
                <div class="col-md-4">
                    <div class="table-ranking">
                        <h2 class="text-center ">Ranking</h2><hr class='bottom-line3'><br><br>
                        <table class="table table-hover table-responsive">
                            <tr>
                                <th scope="row">Nome/Email do jogador</th>
                                <th>Média das Notas</th>
                            </tr>
                            <%
                                double[] notas = new double[BancoUsers.totalUsers()];
                                String[] nomes = new String[BancoUsers.totalUsers()];
                                for (int i = 0; i < BancoUsers.totalUsers(); i++) {
                                    User user = BancoUsers.getUser(i);
                                    notas[i] = user.getMediaNota();
                                    nomes[i] = user.getNome();
                                }
                                double doubleAux = 0;
                                String stringAux;
                                for (int i = 0; i < BancoUsers.totalUsers(); i++) {
                                    for (int j = 0; j < BancoUsers.totalUsers() - 1; j++) {
                                        if (notas[j] < notas[j + 1]) {
                                            doubleAux = notas[j];
                                            notas[j] = notas[j + 1];
                                            notas[j + 1] = doubleAux;

                                            stringAux = nomes[j];
                                            nomes[j] = nomes[j + 1];
                                            nomes[j + 1] = stringAux;
                                        }
                                    }
                                }
                                for (int i = 0; i < BancoUsers.totalUsers(); i++) {%>
                            <tr>
                                <td><%=nomes[i]%></td>
                                <td><%=notas[i]%></td>
                            </tr>
                            <%}%>
                        </table>
                    </div>
                </div>
                <div class="col-md-4">
                    <div id="table2">
                        <h2 class="text-center ">Quizzes Efetuados</h2><hr class='bottom-line3'><br><br>
                        <table class="table table-hover table-responsive">
                            <tr>
                                <th scope="row" >Nome/Email do jogador</th>
                                <th>Média</th>
                            </tr>
                            <%int c = 1;
                                for (int i = BancoUsers.totalQuizzesEfetuados() - 1; i >= 0; i--) {
                                    if (c <= 10) {
                                        Quiz quiz = BancoUsers.getQuizEfetuado(i);%>
                            <tr>
                                <td><%=quiz.getUsuarioTestado()%></td>
                                <td><%=quiz.getMedia()%></td>
                            </tr>
                            <%c++;
                                    }
                                }%>
                        </table>
                    </div>
                </div>
            </div>


            <img class="lion" src="resources/img/coruja.png" alt=""/>
        </section>

        <section id="team" class="container-fluid " >
            <img class="images-cipo" src="resources/img/cipo.png" alt=""/>
            <div class='container'>
                <div class='row container-equip'>
                    <h2 class='text-center '>Equipe</h2> <hr class='bottom-line3'><br><br>
                    <div class='col-md-3 member-team'>
                        <img  src='resources/img/henrique.jpg' alt=''/>
                        <h2>Henrique</h2>
                        <p>Responsável desenvolvimento das funcionalidades do quiz.</p>
                        <p>riquemelo98@gmail.com</p>
                       
                    </div>
                    <div class='col-md-3 member-team' >
                        <img  src='resources/img/muriloXavier.jpg' alt=''/>
                        <h2>Murilo Xavier</h2>
                        <p>Responsável desenvolvimento do sistema de login.</p>
                        <p>muquinhaxl@gmail.com</p>
                                           </div>
                    <div class='col-md-3 member-team'>
                        <img  src='resources/img/murilo.jpg' alt=''/>
                        <h2>Murilo Medeiros</h2>
                        <p>Responsável desenvolvimento da aparência da interface.</p>
                        <p>murilo_medeiros98@hotmail.com</p>
                        
                    </div>
                </div>
            </div>
            <img class="images-animals" src="resources/img/tubarao.png" alt=""/>

        </section>  
        
        <%@include file="WEB-INF/jspf/footer.jspf" %>
        <!-- Jquery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <script>
        </script>
    </body>
</html>
