<%-- 
    Document   : quiz
    Created on : 13/10/2017, 23:41:01
    Author     : murilo
--%>

<%@page import="br.com.fatecpg.connection.Quiz"%>
<%@page import="br.com.fatecpg.connection.Questao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quiz</title>
    </head>
    <body>
        <h1>Quiz</h1>
        <%
            if(request.getParameter("finalizar") != null){
                int acertos = 0;
                for(Questao q: Quiz.getQuestoes()){
                    String resposta = request.getParameter(q.getPergunta());
                    if(resposta != null){
                        if(resposta.equals(q.getResposta())){
                            acertos++;
                        }
                    }
                }
                Quiz.quantidade++;
                Quiz.soma+=(100.0*((double)acertos/10.0));
                response.sendRedirect(request.getContextPath() + "/paginaUsuario.jsp");
            }
        %>

        <form>
            <%for (Questao q: Quiz.getQuestoes()){%>
            <h4><%=q.getPergunta()%></h4>
            <input type="radio" name="<%=q.getPergunta()%>"
                   value="<%=q.getAlternativas()[0]%>"/>
            <%=q.getAlternativas()[0]%>
            <input type="radio" name="<%=q.getPergunta()%>"
                   value="<%=q.getAlternativas()[1]%>"/>
            <%=q.getAlternativas()[1]%>
            <input type="radio" name="<%=q.getPergunta()%>"
                   value="<%=q.getAlternativas()[2]%>"/>
            <%=q.getAlternativas()[2]%>
            <%}%>
             <br/><br/>
            <input type="submit" name="finalizar" value="finalizar"/>
        </form>
    </body>
</html>
