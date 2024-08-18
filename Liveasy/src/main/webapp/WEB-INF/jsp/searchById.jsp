<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Trucks Search by Shipper Id</title>
    </head>
    <body>
        <h2>Trucks Search by Shipper Id</h2>
        <form action="searchById.htm" method="GET">
            <label >Enter Shipper ID:</label>
            <input type="number" id="level" name="truck"   >
            <button type="submit"  >Submit</button>
            <input type="button" value="Home" onclick="window.location.href = 'index.htm?msg=Cancelled'" />
        </form>

        <hr>

        <h3>Details:</h3>
        <table border="1">
            <thead>
                <tr>
                     <th>Shipper Id</th>
                    <th>Loading Point</th>
                    <th>UnLoading Point</th>
                    <th>Product Type</th>
                    <th>Truck type</th>
                    <th>Number Of Truck</th>
                    <th>Weight</th>
                   
                    <th>Comment</th>
                     <th>Date </th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="truck" items="${truck}">
                    <tr>
                          <td>${truck.shipperId}</td>
                        <td>${truck.loadingPoint}</td>
                        <td>${truck.unloadingPoint}</td>
                        <td>${truck.productType}</td>
                        <td>${truck.truckType}</td>
                        <td>${truck.noOfTrucks}</td>
                        <td>${truck.weight}</td>
                        <td>${truck.comment}</td>
                        <td>${truck.date}</td>
                      
                    </tr>
                </c:forEach>
            </tbody>
        </table>
       
    </body>
</html>

<style>/* Reset some default styles */

    body, h2, h3, form, table {
        margin: 0;
        padding: 0;
    }
    a {
        color: #007bff;
        text-decoration: none;
        padding: 5px 10px;

        border-radius: 4px;
        transition: background-color 0.3s ease, color 0.3s ease;
    }


    .editLink:hover {
        background-color: orangered;
        color: white;
    }
    body {
        font-family: Arial, sans-serif;
        background-color: wheat;
        color: #333;
        line-height: 1.6;
        padding: 20px;
    }

    h2, h3 {
        color: #444;
        margin-bottom: 15px;
    }

    form {
        background: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        margin-bottom: 20px;
    }

    label {
        display: block;
        margin-bottom: 8px;
        font-weight: bold;
    }

    input[type="number"] {
        width: calc(100% - 22px);
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }
    .editLink{
        background-color: #007bff;
        color: white;
    }

    button, input[type="button"] {
        background-color: #007bff;
        color: #fff;
        padding: 10px 15px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        margin-right: 10px;
        transition: background-color 0.3s ease;
    }

    button:hover, input[type="button"]:hover {
        background-color: #0056b3;
    }

    hr {
        margin: 20px 0;
        border: 0;
        border-top: 1px solid #ccc;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
        background-color: #f4f4f4;
    }

    thead {
        background-color: #007bff;
        color: #fff;
    }

    th, td {
        padding: 10px;
        text-align: center;
        border: 1px solid #ddd;
    }

    tbody tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    tbody tr:hover {
        background-color: #f1f1f1;
    }

    th {
        font-weight: bold;
    }

    td {
        vertical-align: top;
    }
</style>
