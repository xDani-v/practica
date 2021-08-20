<%-- 
    Document   : index
    Created on : 19 ago. 2021, 21:05:00
    Author     : Daniel Jazmany Villano Escobar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Prueba practica</title>
        <link rel="stylesheet" href="css/bootstrap.css" type="text/css">
    </head>
    <body>
        <%
            //Definicion de las variables
            double peso = 0;
            double altura = 0;
            double imc = 0;
            String clasificacion = "";
            String riesgo = "";
        %>
        <div class="container">
            <div class="justify-content-around">
                <h2>Calculadora de indice de masa corporal</h2>
            </div>
            <form method="post">
                <div>
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Clasificacion</th>
                                <th scope="col">IMC</th>
                                <th scope="col">Riesgo</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">1</th>
                                <td>Insuficiencia</td>
                                <td>menor a 18.5</td>
                                <td>Aumentado</td>
                            </tr>
                            <tr>
                                <th scope="row">2</th>
                                <td>Normal</td>
                                <td>18.5-24.9</td>
                                <td>Promedio</td>
                            </tr>
                            <tr>
                                <th scope="row">3</th>
                                <td>Sobrepeso</td>
                                <td>25-29.9</td>
                                <td>Aumentado</td>
                            </tr>
                            <tr>
                                <th scope="row">4</th>
                                <td>Obesidad grado I</td>
                                <td>30-34.9</td>
                                <td>Moderado</td>
                            </tr>
                            <tr>
                                <th scope="row">5</th>
                                <td>Obesidad grado Il</td>
                                <td>35-39.9</td>
                                <td>Severo</td>
                            </tr>
                            <tr>
                                <th scope="row">6</th>
                                <td>Obesidad grado lll</td>
                                <td>mas de 40</td>
                                <td>Muy severo</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="thumbnail">
                    <input type="text" name="peso" placeholder="Ingrese su peso en (kg)" class="form-control">
                    <br/>
                    <input type="text" name="altura" placeholder="Ingrese su altura en m" class="form-control">
                    <br/>
                    <input type="submit" name="calcular" value="calcular" class="form-control btn btn-primary">

                    <%
                        if (request.getParameter("calcular") != null) {
                            peso = Double.parseDouble(request.getParameter("peso"));
                            altura = Double.parseDouble(request.getParameter("altura"));
                            imc = peso / Math.pow(altura,2);
                            if (imc <= 18.4) {
                                clasificacion = "Insuficiencia";
                                riesgo = "Aumentado";
                            }
                            if (imc >= 18.5 && imc <= 24.9) {
                                clasificacion = "Normal";
                                riesgo = "Promedio";
                            }
                            if (imc >= 25 && imc <= 29.9) {
                                clasificacion = "Sobrepeso";
                                riesgo = "Aumentado";
                            }
                            if (imc >= 30 && imc <= 34.9) {
                                clasificacion = "Obesidad Grado I";
                                riesgo = "Moderado";
                            }
                            if (imc >= 35 && imc <= 39.9) {
                                clasificacion = "Obesidad Grado II";
                                riesgo = "Severo";
                            }
                            if (imc >= 40) {
                                clasificacion = "Obesidad Grado III";
                                riesgo = "Muy Severo";
                            }

                        }
                    %>
                    <br/>
                    <%   
                         if (request.getParameter("calcular") != null)
                        out.print("\nClasificacion:    " + clasificacion);%>
                    <br/>
                    <%  if (request.getParameter("calcular") != null)   
                        out.print("\nIMC:    " + imc); %>
                    <br/>
                    <%  if (request.getParameter("calcular") != null)  
                        out.print("Riesgo:    " + riesgo);%>
                </div>


            </form>
        </div>
    </body>
</html>
