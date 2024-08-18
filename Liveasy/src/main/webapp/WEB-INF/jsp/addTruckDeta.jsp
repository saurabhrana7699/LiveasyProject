<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Registration Page</title>
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
    <body >
        <div class="container">
            <h1>Add Truck Detail</h1>
            <form:form  modelAttribute="Truck" method="POST"  name="userForm"  onsubmit="return validateForm()" >

                <div class="form-group">
                    <label>Loading Point(Starting City Name)</label>
                    <form:input  path="loadingPoint"  />
                </div>

                <div class="form-group">
                    <label>UnLoading Point(Ending City Name)</label>
                    <form:input  path="unloadingPoint"  />
                </div>

                <div class="form-group">
                    <label>Product Type</label>
                    <form:input  path="productType"  />
                </div>

                <div class="form-group">
                    <label>Truck Type</label>
                    <form:input  path="truckType"  />
                </div>

                <div class="form-group">
                    <label>Number Of Truck</label>
                    <form:input type="number" path="noOfTrucks"  />
                </div>

                <div class="form-group">
                    <label>Weight</label>
                    <form:input type="number" path="weight"  />
                </div>

                <div class="form-group">
                    <label>Date </label>
                    <form:input type="date" path="Date"  />
                </div>

                <div class="form-group">
                    <label>Comment</label>
                    <form:input  path="comment"  />
                </div>


                <br>
                <div class="form-buttons">
                    <input type="submit" value="Submit" />
                    <input type="button" value="Cancle" onclick="window.location.href = 'index.htm?msg=Cancelled';" />
                </div>     

            </form:form>
            <div class="message">${msg}${param.saurabh}</div>
        </div>
    </body>
</html>
<script>

    function validateForm() {
        const loding = document.forms["userForm"]["loadingPoint"].value;
        const unloding = document.forms["userForm"]["unloadingPoint"].value;
        const Product = document.forms["userForm"]["productType"].value;
        const Truck = document.forms["userForm"]["truckType"].value;
        const NumTruck = document.forms["userForm"]["noOfTrucks"].value;
        const Weight = document.forms["userForm"]["weight"].value;   
        const date = document.forms["userForm"]["Date"].value;
        const cmt = document.forms["userForm"]["comment"].value;


        if (loding === "") {
            alert("Please Insert Loding Point");
            return false;
        }
        if (unloding === "") {
            alert("Please Insert UnLoding Point");
            return false;
        }
        if (Product === "") {
            alert("Please Insert Product Type");
            return false;
        }

        if (Truck === "") {
            alert("Please Insert Truck Type");
            return false;
        }

        if (NumTruck === "") {
            alert("Please Insert  Number Of Truck ");
            return false;
        }
         if (Weight === "") {
            alert("Please Insert  Weight");
            return false;
        }
         if (date === "") {
            alert("Please Insert  Date");
            return false;
        }
         if (cmt === "") {
            alert("Please Insert  Comment");
            return false;
        }


        return true;
    }

</script>

