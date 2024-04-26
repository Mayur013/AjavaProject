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
    flex-direction: row;
    font-family: Arial, sans-serif;
    background-color: #f1f1f1;
    background-image: url('images/small-page-background(2).png');
    justify-content: center;
/*    align-items: center;*/
    height: 100vh;
    margin: 0;
}

.con1{
    width: 50%;
}
.container {
    
justify-content: center;
align-items: center;
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
    <div class="pdd1">
<h1 class="cco">Manage Category</h1>

<div class="container">
    <label for="name" class="cco">Category Name:</label>
    <input type="text" class="form-control" id="name" name="name" required>
    <div class="form-group row d-flex justify-content-between mx-auto pdd">
    <button class="btn btn-primary" onclick="saveCategory()">Save</button>
    <button class="btn btn-danger" onclick="clearFields()">Clear</button>
    <button class="btn btn-secondary" onclick="redirectToMainPage()">Back</button>
    </div>
</div>
    </div>
    <p id="ppp"></p>
<div class="container con1 pdd1">
    <h2 class="cco">View Category</h2>
    
    <sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver"
                    url="jdbc:mysql://localhost:3306/cms"
                    user="root" password="mayur013" />

<sql:query var="result" dataSource="${dataSource}">
    select * from catagory;
</sql:query>
    
    <table id="categoryTable" class="table table-hover table-bordered tblCl" border="2 solid">
        <thead>
            <tr>
                <th>ID</th>
                <th>Category</th>
            </tr>
        </thead>
        <tbody id="categoryList">
            <!-- Table rows will be dynamically populated here -->
            <c:forEach var="row" items="${result.rows}">
        <tr>
            <td>${row.ID}</td>
            <td>${row.Name}</td>
            <!-- Retrieve more columns as needed -->
        </tr>
    </c:forEach>
        </tbody>
    </table>
</div>
    <p id="ppp"></p>

    
    
<script>

    function saveCategory() {
        var nam = document.getElementById('name').value;
            // Specify the URL of the servlet
            var servletURL = "saveManage"; // Update with your servlet URL
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

            var hiddenInput2 = document.createElement('input');
            hiddenInput2.type = 'hidden';
            hiddenInput2.name = 'name'; // Replace with your parameter name if needed
            hiddenInput2.value = nam;
               
            // Append the hidden input field to the form
            form.appendChild(hiddenInput);
            form.appendChild(hiddenInput2);

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
    
    function clearFields() {
        document.getElementById('name').value = '';
    }

    function deleteCategory(button) {
        var row = button.parentNode.parentNode;
        row.parentNode.removeChild(row);
    }

    // Function to generate a random ID (replace with actual ID generation logic)
    function generateId() {
        return Math.floor(Math.random() * 1000) + 1;
    }
    
    
    var rows = document.querySelectorAll('#categoryTable tr');

    // Loop through each row and add click event listener
    rows.forEach(function(row) {
    row.addEventListener('click', function() {
        var id = row.cells[0].textContent; // Assuming ID is in the first column
        deleteRow(id);
//        location.reload();
    });
});

function deleteRow(id) {
            // Specify the URL of the servlet
            var servletURL = "deleteRowServlet"; // Update with your servlet URL

            // Create a form element dynamically
            var form = document.createElement('form');
            form.method = 'post'; // Use POST method
            form.action = servletURL; // Set the action to your servlet URL

            // Create a hidden input field to carry any data if needed
            var hiddenInput = document.createElement('input');
            hiddenInput.type = 'hidden';
            hiddenInput.name = 'id'; // Replace with your parameter name if needed
            hiddenInput.value = id; // Replace with your parameter value if needed
            
            var userEmail ="<%= request.getParameter("email")%>";
            
            var hiddenInput2 = document.createElement('input');
            hiddenInput2.type = 'hidden';
            hiddenInput2.name = 'email'; // Replace with your parameter name if needed
            hiddenInput2.value = userEmail;
               
            // Append the hidden input field to the form
            form.appendChild(hiddenInput);
            form.appendChild(hiddenInput2);

            // Append the form to the document body and submit it
            document.body.appendChild(form);
            form.submit();
        }

</script>

</body>
</html>

