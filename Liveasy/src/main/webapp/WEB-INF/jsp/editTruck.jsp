
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Edit truck Details</title>
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: wheat;
                margin: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            .container {
                background: #fff;
                padding: 40px 50px;
                border-radius: 10px;
                box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
                width: 100%;
                max-width: 600px;
                box-sizing: border-box;
            }

            h1 {
                font-size: 24px;
                margin-bottom: 20px;
                color: #333;
                text-align: center;
            }

            label {
                display: block;
                margin-bottom: 5px;
                font-weight: bold;
                color: #555;
                text-align: left;
            }



            input[type="text"],
            input[type="password"],
            input[type="email"],
            input[type="number"],
            select {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-sizing: border-box;
                font-size: 14px;
                margin-bottom: 10px;
            }

            .form-group-half {
                width: 48%;
            }

            #specialities {
                margin-bottom: 20px;
                text-align: left;
            }

            .form-buttons {
                display: flex;
                justify-content: space-between;
            }

            input[type="submit"],
            input[type="button"] {
                width: 48%;
                padding: 12px;
                border: none;
                border-radius: 5px;
                background: blue;
                color: #fff;
                font-size: 16px;
                cursor: pointer;
                transition: background 0.3s ease;
            }

            input[type="button"] {
                background: red;
            }

            input[type="submit"]:hover {
                background: darkblue;
            }

            input[type="button"]:hover {
                background: darkred;
            }

            .message {
                color: #007bff;
                margin-top: 20px;
            }
            #slide{
                margin-left: 250px;
                margin-top: -40px;
            }

        </style>

    </head>
    <body onload="showSpecialities();">
        <div class="container">
            <h1>Edit Truck Details</h1>
            <form:form   modelAttribute="truck" method="POST"   action="editTruck.htm" onsubmit="return validateForm()">

                <form:hidden path="shipperId" />
                <div class="form-group">
                    <label>loading Point(City Name</label>
                    <form:input  path="loadingPoint" id="loadingPoint" />
                </div>
                <div class="form-group">
                    <label>Unloading Point(City Name)</label>
                    <form:input  path="unloadingPoint" id="unloadingPoint" />
                </div>
                <div class="form-group">
                    <label>Product Type</label>
                    <form:input  path="productType" id="productType" />
                </div>
                <div class="form-group">
                    <label>Truck Type</label>
                    <form:input  path="truckType" id="truckType" />
                </div>
                <div class="form-group">
                    <label>Number Of Truck</label>
                    <form:input  path="noOfTrucks" id="noOfTrucks" />
                </div>
                <div class="form-group">
                    <label>Weight</label>
                    <form:input  path="weight" id="weight" />
                </div>

                <div class="form-group">
                    <label>Date </label>
                    <form:input type="date" path="Date"  id="Date"  />
                </div>

                <div class="form-group">
                    <label>Comment</label>
                    <form:input  path="comment" id="comment" />
                </div>

                <br>
                <div class="form-buttons">
                    <input type="submit" value="Submit" />
                    <input type="button" value="Cancle" onclick="window.location.href = 'allTruckDetail.htm?msg=Cancelled';" />
                </div>     

            </form:form>
            <div class="message">${msg}</div>
        </div>
    </body>
</html>
<script>


    function validateForm() {
        var loadingPoint = document.getElementById("loadingPoint").value;
        var unloadingPoint = document.getElementById("unloadingPoint").value;
        var productType = document.getElementById("productType").value;
        var truckType = document.getElementById("truckType").value;
        var noOfTrucks = document.getElementById("noOfTrucks").value;
        var weight = document.getElementById("weight").value;
        var Date = document.getElementById("Date").value;
        var comment = document.getElementById("comment").value;



        if (loadingPoint === "") {
            alert("Please Insert Loading Point");
            return false;
        }

        if (unloadingPoint === "") {
            alert("Please Insert UnLoading Point");
            return false;
        }


        if (productType === "") {
            alert("Please Insert Product Type");
            return false;
        }

        if (truckType === "") {
            alert("Please Insert Truck Type");
            return false;
        }

        if (noOfTrucks === "") {
            alert("Please Insert Number Of Truck");
            return false;
        }


        if (weight === "") {
            alert("Please Insert  Weight");
            return false;
        }
        if (Date === "") {
            alert("Please Insert Date");
            return false;
        }

        if (comment === "") {
            alert("Please Insert Comment");
            return false;
        }






        return true;
    }
</script>

