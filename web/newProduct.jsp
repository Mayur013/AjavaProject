<%-- 
    Document   : manageCatagory
    Created on : 16-Apr-2024, 6:24:24 pm
    Author     : mayur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Manage Category</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
    body {
        display: flex; /* Use flexbox */
    flex-direction: column;
    font-family: Arial, sans-serif;
    background-color: #f1f1f1;
    background-image: url('images/small-page-background(2).png');
    /*justify-content: center;*/
    align-items: center;
    height: 100vh;
    margin: 0;
}

.con1{
    width: 50%;
}
.container {
    
justify-content: center;
align-items: center;
/*width:100%;*/
}
.container1{
    width:90%;
    display: flex;
    justify-content: center;
}

h1 {
    text-align: center;
    color: #333;
}
.tblCl{
    /*border: 2px solid #000000;*/
    background-color: #FFFFFF;
}
.cco{
    color: #FFFFFF; 
    font-weight: bold;
}
.pdd{
    margin-top: 5px;
    /*padding-right: 100px;*/
}
.pdd1{
    margin: 15px;
    /*padding-right: 100px;*/
}


</style>
</head>
<body>
    <sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver"
                    url="jdbc:mysql://localhost:3306/cms"
                    user="root" password="mayur013" />

<sql:query var="result" dataSource="${dataSource}">
    select * from catagory;
</sql:query>
    <div class="pdd1">
        <form>
<h1 class="cco">Add Product</h1>

<div class="container">
    <div class="form-group row cco">
                <label for="name" class="col-sm-3 col-form-label">Name:</label>
                <div class="col-sm-9">
                <input type="text" class="form-control" id="name" name="name" placeholder="Name" required>
                </div>
    </div>
    <div class="form-group row cco">
                <label for="category" class="col-sm-3 col-form-label">Catagory:</label>
                <div class="col-sm-9">
                    <select id="category" class="form-control" name="category">
                        
                        <c:forEach var="row" items="${result.rows}">
                               <option value="${row.Name}">${row.Name}</option>
                        </c:forEach>
                        
                    </select>
                </div>
    </div>
    <div class="form-group row cco">
                <label for="price" class="col-sm-3 col-form-label">Price:</label>
                <div class="col-sm-9">
                <input type="text" class="form-control" id="price" name="price" placeholder="Price" required>
                </div>
    </div>

    
    <div class="form-group row d-flex justify-content-between mx-auto pdd">
        <input type="button" onclick="redirectToSaveNewProduct()" class="btn btn-primary" value="Save"/>
        <input type="reset" class="btn btn-danger" value="Clear"/>
    <button class="btn btn-secondary" onclick="redirectToMainPage()">Back</button>
    </div>
</div>
        </form>
    </div>


    
    
<script>
    

    function redirectToSaveNewProduct() {
            // Specify the URL of the servlet
            var servletURL = "saveNewProduct"; // Update with your servlet URL
            var userEmail ="<%= request.getParameter("email")%>";
            var name=document.getElementById("name").value;
            var category=document.getElementById("category").value;
            var price=document.getElementById("price").value;
            // Create a form element dynamically
            var form = document.createElement('form');
            form.method = 'post'; // Use POST method
            form.action = servletURL; // Set the action to your servlet URL

            // Create a hidden input field to carry any data if needed
            var hiddenInput = document.createElement('input');
            hiddenInput.type = 'hidden';
            hiddenInput.name = 'email'; // Replace with your parameter name if needed
            hiddenInput.value = userEmail; // Replace with your parameter value if needed
            
            var hiddenInput2 = document.createElement('input');
            hiddenInput2.type = 'hidden';
            hiddenInput2.name = 'name'; // Replace with your parameter name if needed
            hiddenInput2.value = name; // Replace with your parameter value if needed
            
            var hiddenInput3 = document.createElement('input');
            hiddenInput3.type = 'hidden';
            hiddenInput3.name = 'category'; // Replace with your parameter name if needed
            hiddenInput3.value = category; // Replace with your parameter value if needed
            
            var hiddenInput4 = document.createElement('input');
            hiddenInput4.type = 'hidden';
            hiddenInput4.name = 'price'; // Replace with your parameter name if needed
            hiddenInput4.value = price; // Replace with your parameter value if needed

            // Append the hidden input field to the form
            form.appendChild(hiddenInput);
            form.appendChild(hiddenInput2);
            form.appendChild(hiddenInput3);
            form.appendChild(hiddenInput4);

            // Append the form to the document body and submit it
            document.body.appendChild(form);
            form.submit();
        }
    function redirectToMainPage() {
            // Specify the URL of the servlet
            var servletURL = "MainPage.jsp"; // Update with your servlet URL
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

</body>
</html>

