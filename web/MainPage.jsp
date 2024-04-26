<%-- 
    Document   : MainPage
    Created on : 16-Apr-2024, 2:09:50 pm
    Author     : mayur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
<script>

// Replace with actual code to get user's email

//    // Check if the user's email is admin
//    if (userEmail === "Admin@gmail.com") {
//        document.getElementById("iop").style.display = "block"; // Show the bottom div
//    } else {
//        document.getElementById("iop").style.display = "none"; // Hide the bottom div
//    }

function showAdminButtons() {
    // Check if the user is logged in as admin
    var userEmail ="<%= request.getParameter("email")%>"; // Replace with actual code to get user's email
    
    // Check if the user's email is admin
    if (userEmail !== "Admin@gmail.com") {
//        document.getElementById("ppp").innerHTML=userEmail;
        document.getElementById("iop").style.display = "none"; // Hide the bottom div
    }
}

    

function redirectToManageCatagory() {
            // Specify the URL of the servlet
            var servletURL = "manageCatagory.jsp"; // Update with your servlet URL
            var userEmail ="<%= request.getParameter("email")%>";
            // Create a form element dynamically
            var form = document.createElement('form');
            form.method = 'post'; // Use POST method
            form.action = servletURL; // Set the action to your servlet URL

            // Create a hidden input field to carry any data if needed
            var hiddenInput = document.createElement('input');
            hiddenInput.type = 'hidden';
            hiddenInput.name = 'email'; // Replace with your parameter name if needed
            hiddenInput.value = userEmail; // Replace with your parameter value if needed

            // Append the hidden input field to the form
            form.appendChild(hiddenInput);

            // Append the form to the document body and submit it
            document.body.appendChild(form);
            form.submit();
        }
        function redirectToLogin() {
            // Specify the URL of the servlet
            var servletURL = "Logout"; // Update with your servlet URL

            // Create a form element dynamically
            var form = document.createElement('form');
            form.method = 'post'; // Use POST method
            form.action = servletURL; // Set the action to your servlet URL

            // Create a hidden input field to carry any data if needed
            var hiddenInput = document.createElement('input');
            hiddenInput.type = 'hidden';
            hiddenInput.name = 'paramName'; // Replace with your parameter name if needed
            hiddenInput.value = 'paramValue'; // Replace with your parameter value if needed

            // Append the hidden input field to the form
            form.appendChild(hiddenInput);

            // Append the form to the document body and submit it
            document.body.appendChild(form);
            form.submit();
        }
        function redirectToViewEditDelete() {
            // Specify the URL of the servlet
            var servletURL = "viewEditDeleteProduct.jsp"; // Update with your servlet URL
            var userEmail ="<%= request.getParameter("email")%>";
            // Create a form element dynamically
            var form = document.createElement('form');
            form.method = 'post'; // Use POST method
            form.action = servletURL; // Set the action to your servlet URL

            // Create a hidden input field to carry any data if needed
            var hiddenInput = document.createElement('input');
            hiddenInput.type = 'hidden';
            hiddenInput.name = 'email'; // Replace with your parameter name if needed
            hiddenInput.value = userEmail; // Replace with your parameter value if needed

            // Append the hidden input field to the form
            form.appendChild(hiddenInput);

            // Append the form to the document body and submit it
            document.body.appendChild(form);
            form.submit();
        }
        function redirectToVerifyUSer() {
            // Specify the URL of the servlet
            var servletURL = "verifyUser.jsp"; // Update with your servlet URL
            var userEmail ="<%= request.getParameter("email")%>";
            // Create a form element dynamically
            var form = document.createElement('form');
            form.method = 'post'; // Use POST method
            form.action = servletURL; // Set the action to your servlet URL

            // Create a hidden input field to carry any data if needed
            var hiddenInput = document.createElement('input');
            hiddenInput.type = 'hidden';
            hiddenInput.name = 'email'; // Replace with your parameter name if needed
            hiddenInput.value = userEmail; // Replace with your parameter value if needed

            // Append the hidden input field to the form
            form.appendChild(hiddenInput);

            // Append the form to the document body and submit it
            document.body.appendChild(form);
            form.submit();
        }
        function redirectToNewProduct() {
            // Specify the URL of the servlet
            var servletURL = "newProduct.jsp"; // Update with your servlet URL
            var userEmail ="<%= request.getParameter("email")%>";
            // Create a form element dynamically
            var form = document.createElement('form');
            form.method = 'post'; // Use POST method
            form.action = servletURL; // Set the action to your servlet URL

            // Create a hidden input field to carry any data if needed
            var hiddenInput = document.createElement('input');
            hiddenInput.type = 'hidden';
            hiddenInput.name = 'email'; // Replace with your parameter name if needed
            hiddenInput.value = userEmail; // Replace with your parameter value if needed

            // Append the hidden input field to the form
            form.appendChild(hiddenInput);

            // Append the form to the document body and submit it
            document.body.appendChild(form);
            form.submit();
        }
        function redirectToPlaceOrder() {
            // Specify the URL of the servlet
            var servletURL = "PlaceOrder.jsp"; // Update with your servlet URL
            var userEmail ="<%= request.getParameter("email")%>";
            // Create a form element dynamically
            var form = document.createElement('form');
            form.method = 'post'; // Use POST method
            form.action = servletURL; // Set the action to your servlet URL

            // Create a hidden input field to carry any data if needed
            var hiddenInput = document.createElement('input');
            hiddenInput.type = 'hidden';
            hiddenInput.name = 'email'; // Replace with your parameter name if needed
            hiddenInput.value = userEmail; // Replace with your parameter value if needed

            // Append the hidden input field to the form
            form.appendChild(hiddenInput);

            // Append the form to the document body and submit it
            document.body.appendChild(form);
            form.submit();
        }
</script>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
    body {
        
    font-family: Arial, sans-serif;

    padding-left: 50px;
    padding-right: 50px;
    padding-top: 40px;
    padding-bottom: 40px;
    background-image: url('images/home-background-image(1).png');
    
}

.container1 {
    
    width: 100%;
    margin: auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
    text-align: center;
    color: #333;
}


.top-div {
    margin-bottom: 500px;
}

/* Position div at the bottom */
.bottom-div {
    
    margin-top: 570px;
    
}
</style>
</head>
<body onload="showAdminButtons()">
    <!--<p id="ppp"></p>-->
    <div class="top-div">
        <div class="form-group row d-flex justify-content-between ">
<!--            <input type="button" id="lgou" onclick="redirectToLogin()" class="btn btn-primary" value="Log Out">
            <input type="button" onclick="inv()" class="btn btn-primary" value="Place Order">
            <input type="button" class="btn btn-primary" value="View Bill & Order Placed Details">
            <input type="button" class="btn btn-primary" value="Change Password">
            <input type="button" class="btn btn-primary" value="Change Security Question">    -->
            <button id="logout" onclick="redirectToLogin()" class="btn btn-primary">Log Out</button>
            <button onclick="redirectToPlaceOrder()" class="btn btn-primary">Place Order</button>
<!--            <button class="btn btn-primary">View Bill & Order Placed Details</button>
            <button class="btn btn-primary">Change Password</button>
            <button class="btn btn-primary">Change Security Question</button>-->
        </div>
    </div>

    <div class="bottom-div" id="iop">
        <div class="form-group row d-flex justify-content-between ">
<!--            <input type="button" class="btn btn-primary" value="Manage Category">
            <input type="button" class="btn btn-primary" value="New Product">
            <input type="button" class="btn btn-primary" value="View, Edit & Delete Product">
            <input type="button" class="btn btn-primary" value="Verify Users">      -->
<button class="btn btn-primary" onclick="redirectToManageCatagory()">Manage Category</button>
<button class="btn btn-primary" onclick="redirectToNewProduct()">New Product</button>
<button class="btn btn-primary" onclick="redirectToViewEditDelete()">View, Edit & Delete Product</button>
            <button class="btn btn-primary" onclick="redirectToVerifyUSer()">Verify Users</button>

        </div>
    </div>
</body>
</html>

