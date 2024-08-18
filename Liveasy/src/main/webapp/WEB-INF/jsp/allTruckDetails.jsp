
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>All Employees List</title>
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                line-height: 1.6;
                background-color: wheat;
                padding: 20px;
            }

            a {
                color: red;
                text-decoration: none;
                padding: 5px 10px;
                border: 1px solid red;
                border-radius: 4px;
                transition: background-color 0.3s ease, color 0.3s ease;
            }
            #home:hover{
                background-color: #0056b3;
                border: 1px solid #0056b3;
            }
            #home{
                color:white;
                background-color: #007bff;
                border: 1px solid #007bff
            }
            #log{
                color: white;
                background-color: red;
                border: 1px solid red;
            }

            a:hover {
                color: white;
                background-color: blue;
                text-decoration: none;
            }


            fieldset {
                border: 1px solid #ddd;
                border-radius: 8px;
                padding: 20px;
                background-color: #fff;
            }

            legend {
                font-size: 24px;
                color: #333;
                padding: 0 10px;
                width: auto;
                border-bottom: none;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
                background-color: #fff;
            }

            table, th, td {
                border: 1px solid #ddd;
            }

            th, td {
                padding: 12px;
                text-align: center;
            }

            th {
                background-color: #f2f2f2;
            }

            tbody tr:nth-child(even) {
                background-color: #f9f9f9;
            }

            tbody tr:hover {
                background-color: #f1f1f1;
            }

            .editLink {
                color: green;
                border: 1px solid green;
            }

            .editLink:hover {
                background-color: green;
                color: white;
            }

            .msg {
                color: #ff0000;
                margin-top: 20px;
            }

            #log:hover{
                background-color:#D2122E;
                border: 1px solid #D2122E;
                color: white;
            }
            #changes{
                color: green;
            }

            #delete:hover{
                color: white;
                background-color: red;
                border: 1px solid red;
            }


        </style>

    </head>
    <body> <a href="index.htm" id="home">Home</a>


        <fieldset>
            <legend> Truck Detail List</legend>
            <div id="changes">${msg}

            </div>
            <table>
                <thead>
                    <tr>
                          <th>Shipper Id</th>
                        <th>Loading Point</th>
                        <th>Unloading Point</th>
                        <th>Product Type</th>
                        <th>Truck Type</th>
                        <th>Number Of Truck</th>
                        <th>Weight</th>
                        <th>Date</th>
                        <th>Comment</th>
                        <th>Edit</th>
                        <th>Delete</th>

                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${allTruck}" var="truck">
                        <tr>
                            <td>${truck.shipperId}</td>
                            <td>${truck.loadingPoint}</td>
                            <td>${truck.unloadingPoint}</td>
                            <td>${truck.productType}</td>
                            <td>${truck.truckType}</td>
                            <td>${truck.noOfTrucks}</td>
                            <td>${truck.weight}</td>
                            <td>${truck.date}</td>
                            <td>${truck.comment}</td>

                            <td><a class="editLink" href="javascript:editTruck(${truck.shipperId});">Edit</a></td>
                            <td><a  id="delete" href="javascript:deleteTruck(${truck.shipperId});">Delete </a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <form name="editForm" id="editForm" method="POST" action="showEditTruck.htm">
                <input type="hidden" name="shipperId" id="shipperId"/>
            </form>
            <form name="deleteOrderForm" id="deleteOrderForm" method="POST" action="deleteTruckDetails.htm">
                <input type="hidden" name="deleteTruckId" id="deleteOrderId" value=""/>
            </form>
        </fieldset>
    </body>
</html>
<script type="text/javascript">
    function editTruck(shipperId) {
        document.getElementById("shipperId").value = shipperId;
        document.getElementById("editForm").submit();
    }

    function deleteTruck(orderId) {
        if (confirm('Are you sure you want to delete this Truck Details?')) {
            document.getElementById("deleteOrderId").value = orderId;

            setTimeout(function () {
                alert("Truck details are deleted");
                document.getElementById("deleteOrderForm").submit();
            }, 1000);

        } else {

            console.log('Deletion cancelled by Admin');
        }

    }
</script>
