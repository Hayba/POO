<%-- 
    Document   : amortizacao-constante
    Created on : 16/03/2019, 16:15:24
    Author     : Hayba
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <h1>Sistema de Amortização Constante</h1>
        <form>
            insira valor do montante
            <input type="text" name="montante" placeholder="Ex: 10000">
            insira o número de parcelas
            <input type="text" name="parcelas" placeholder="Ex: 10">
            insira o valor do juros ao mês
            <input type="text" name="juros" placeholder="Ex: 2.5">
            <input type="submit" name="Gerar">
        </form>
            
        <%@include file="WEB-INF/jspf/footer.jspf"%>
    </body>
</html>
