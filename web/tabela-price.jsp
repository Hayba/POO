 <%-- 
    Document   : amortizacao-americana
    Created on : 19/03/2019, 01:31:43
    Author     : Greenzl
--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Price</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %> 
        <h1><center>Tabela Price</center></h1>
        <hr/>
        
        <form>

                <tr>
                    <td>Valor Financiado: <input type="text" name="valorFinanciado" placeholder="Ex: 1000"></td>
                    <td>Número de meses: <input type="text" name="mes" placeholder="Ex: 12"></td>
                    <td> Taxa Juros Mensal "%": <input type="text" name="juros" placeholder="Ex: 2.5"></td>
                    <td><input type="submit" name="start" value="Gerar"></td>
                </tr>
            <br/><br>
            <% if(request.getParameter("start")!=null){ %>
                <% try{ %>
                <% int i=1; %>
                <% double vf = Double.valueOf(request.getParameter("valorFinanciado")); %>
                <% double meses = Double.valueOf(request.getParameter("mes")); %>
                <% double jurosInput = Double.valueOf(request.getParameter("juros")); %>
                <% double amort = 0; %>
                <% double totalAmortizacao = 0; %>
                <% double parcela = 0; %>
                <% double totalParcela = 0; %>
                <% double jurosOutput = 0; %>
                <% double totalJurosOutput = 0; %>
                <% double saldoDevedor = 0; %>
                <% double juros100 = jurosInput/100; %>
               
                
                
                <table border="1">
                    <tr>
                        <th>#</th>
                        <th>Parcelas</th>
                        <th>Amortizações</th>
                        <th>Juros</th>
                        <th>Saldo Devedor</th>
                    </tr>
                    <% parcela = vf * ((Math.pow(1+juros100, meses)) * juros100)/((Math.pow(1+juros100, meses)) - 1); %>
                    <% jurosOutput = vf * juros100; %>
                    <% amort = parcela - jurosOutput; %>
                    <% saldoDevedor = vf - amort; %>
                        <tr>
                            <td><%= i %></td>
                            <td><%= parcela %></td>
                            <td><%= amort %></td>
                            <td><%= jurosOutput %></td>
                            <td><%= saldoDevedor %></td>  
                        </tr>
                    <% totalAmortizacao = totalAmortizacao + amort; %>
                    <% totalJurosOutput += jurosOutput; %>
                    <% totalParcela += parcela; %>
                    
                    <% for(i =2 ; i<=meses; i++){%>                        
                        <% jurosOutput = saldoDevedor*juros100; %>
                        <% amort = parcela - jurosOutput; %>
                        <% saldoDevedor = saldoDevedor - amort; %>
                        <% if(i==meses){ %>
                        <% saldoDevedor = 0;%>
                        <% } %>
                      <tr>
                            <td><%= i %></td>
                            <td><%= parcela %></td>
                            <td><%= amort %></td>
                            <td><%= jurosOutput %></td>
                            <td><%= saldoDevedor %></td>  
                        </tr>
                        <% totalAmortizacao = totalAmortizacao + amort; %>
                        <% totalJurosOutput += jurosOutput; %>
                        <% totalParcela += parcela; %>
                            
                    <% }%>
                    <tr>
                        <td> >> </td>
                        <td><%= totalParcela %></td>
                        <td><%= totalAmortizacao%></td>
                        <td><%= totalJurosOutput%></td>
                        <td><center><b> <<-TOTAIS </b></center></td> 
                    </tr>
                </table>
                <br/>    
                 <%
                }catch(Exception e){
                    %>
                    Valor invalido
                <%
            }
            
        }
        %>
        </form>
    </body>
    <footer>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </footer>
</html>
