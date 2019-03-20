 <%-- 
    Document   : amortizacao-americana
    Created on : 18/03/2019, 22:11:07
    Author     : Greenzl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistema de Amortização Americana</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %> 
        <h1><center>Sistema de Amortização Americana</center></h1>
        <hr>
        
        <form>
            Valor Financiado: <input type="textr" name="valorFinanciado" placeholder="Ex: 10000">
            Número de meses: <input type="text" name="mes" placeholder="Ex: 12">
             Taxa Juros "%": <input type="text" name="juros" placeholder="Ex: 2.5">
            <input type="submit" name="start" value="Gerar"><br/><br/>
            </form>
            
            <% if(request.getParameter("start")!=null){ %>
                
                <% try{ %>
                <% int i=0; %>
                <% double vf = Double.valueOf(request.getParameter("valorFinanciado")); %>
                <% double meses = Double.valueOf(request.getParameter("mes")); %>
                <% double jurosInput = Double.valueOf(request.getParameter("juros")); %>
                <% double amort = 0; %>
                <% double totalAmortizacao = 0; %>
                <% double parc = 0; %>
                <% double totalParcial = 0; %>
                <% double jurosOutput = 0; %>
                <% double totalJurosOutput = 0; %>
                <% double saldoDevedor = 0; %>
                <% double juros100 = jurosInput/100; %>
                
                
                
                <table border="1">
                    <tr >
                        <td>#</td>
                        <td>Parcelas</td>
                        <td>Amortizações</td>[
                        <td>Juros</th>
                        <td>Saldo Devedor</td>
                    </tr>
                        
                    <% for(i =1 ; i<=meses; i++){%>
                        <% saldoDevedor = vf; %>
                        <% jurosOutput =  juros100 * saldoDevedor; %>
                        <% parc = jurosOutput; %>
                        
                        <% if(i == meses){ %>
                            <% amort = saldoDevedor; %>
                            <% saldoDevedor = 0; %>
                            <% parc = amort + jurosOutput; %>
                        <% } %>
                       
                        <tr>
                            <td><%= i %></td>
                            <td><%= parc %></td>
                            <td><%= amort %></td>
                            <td><%= jurosOutput %></td>
                            <td><%= saldoDevedor %></td>  
                        </tr>
                        
                        
                        
                        <% totalAmortizacao = totalAmortizacao + amort; %>
                        <% totalJurosOutput += jurosOutput; %>
                        <% totalParcial += parc; %>
                            
                    <% }%>
                        
                
                    <tr>
                        <td> >> </td>
                        <td><%= totalParcial %></td>
                        <td><%= totalAmortizacao %></td>
                        <td><%= totalJurosOutput %></td>
                        <td><center><b> <<-TOTAIS </b></center></td> 
                    </tr>
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