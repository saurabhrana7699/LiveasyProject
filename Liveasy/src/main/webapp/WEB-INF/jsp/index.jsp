
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
    <head>
          <title>Index Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: wheat;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            .container {
                background-color: #fff;
                padding: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
                text-align: center;
            }

            h1 {
                font-size: 24px;
                color: #333;
                margin-bottom: 20px;
            }

            .user-info {
                font-size: 18px;
                color: #666;
                margin-bottom: 20px;
            }

            a {
                text-decoration: none;
                color: #007bff;
                font-weight: bold;
                margin: 0 10px;
            }



            .nav-links {
                margin-bottom: 20px;
            }

            .nav-links a {
                display: inline-block;
                padding: 10px 20px;
                background-color: #007bff;
                color: #fff;
                border-radius: 4px;
                transition: background-color 0.3s;
            }

            .nav-links a:hover {
                background-color: green;
            }

            #log:hover{
                background-color:darkred;
            }
            #log{
                background-color: red;
            }

        </style>
    </head>
    <body>
        <div class="container">
          
            <h1>Welcome To Liveasy Logistics</h1>
         
            <div class="nav-links">

                <a href="register.htm"> Add Truck Detail</a>
                <a href="allTruckDetail.htm"> All Truck Detail</a>
                 <a href="searchById.htm"> Search Truck Details by ShipperId</a>

             
            </div>
        </div>
    </body>
</html>

