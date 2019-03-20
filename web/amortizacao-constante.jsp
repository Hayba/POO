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
        <h1><center>Sistema de Amortização Constante</center></h1>
        <hr/>
        
        <form>
            Valor Financiado: 
            <input type="text" name="montante" placeholder="Ex: 10000"/>
            Numero de Meses: 
            <input type="text" name="parcelas" placeholder="Ex: 10"/>
            Taxa Juros "%": 
            <input type="text" name="juros" placeholder="Ex: 2.5"/>
            <input type="submit" name="gerar" value="Gerar"/>
            <br>
            <br>
        </form>
        <%if(request.getParameter("gerar")!=null){
            try{
                double montante = Double.parseDouble(request.getParameter("montante"));
                double parcela = Double.parseDouble(request.getParameter("parcelas"));
                double juros = Double.parseDouble(request.getParameter("juros"))/100;
                double amortizacao = montante/parcela;
                double devedor = montante;
                double valorjuros;
                double prestacao;
            %>    
            
                <hr/>
                    <table border="1">
                        <tr><th>Parcela</th><th>Saldo Devedor</th><th>Juros</th><th>Valor da Amortização</th><th>Prestação</th></tr>
                        <%for(int i=1; i<=parcela; i++){%>
                        <tr>
                            <td><%=i%></td>
                            <td><%=montante%></td>
                            <td><%=valorjuros=juros*montante%></td>
                            <td><%=amortizacao%></td>
                            <td><%=prestacao = amortizacao+valorjuros%></td>
                            
                        </tr>
                        <%montante=montante-amortizacao;%>
                        <%}%>
                    </table>   
            <%
                }catch(Exception e){
                    %>
                    Valor invalido
                <%
            }
            
        }
        %>
            
        <%@include file="WEB-INF/jspf/footer.jspf"%>
    </body>
</html>
