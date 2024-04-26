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
}
.container1{
    width:90%;
    display: flex;
    justify-content: center;
    
    /*margin-top: 15px;*/
        /*width: 95%;  Adjust width as needed */
        height: 90vh; /* Adjust height as needed */
        overflow: auto; /* Add scrollbars when content exceeds container size */
        
    
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
<h1 class="cco">Verify User</h1>

<div class="container">
    <label for="name" class="cco">Search:</label>
    <input type="text" class="form-control" id="name" name="name" required>
    <div class="form-group row d-flex justify-content-between mx-auto pdd">
<!--    <button class="btn btn-primary" onclick="saveCategory()">Save</button>
    <button class="btn btn-danger" onclick="clearFields()">Clear</button>-->
    <button class="btn btn-secondary" onclick="redirectToMainPage()">Back</button>
    </div>
</div>
    </div>
    <p id="ppp"></p>
<div class="container1 con1 pdd1" >
    <!--<h2 class="cco">View Category</h2>-->
    
    <sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver"
                    url="jdbc:mysql://localhost:3306/cms"
                    user="root" password="mayur013" />

<sql:query var="result" dataSource="${dataSource}">
    select * from user;
</sql:query>
    
    <table id="categoryTable" class="table table-hover table-bordered tblCl" border="2 solid">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Mobile Number</th>
                <th>Address</th>
                <th>Security Question</th>
                <th>Status</th>
                
            </tr>
        </thead>
        <tbody id="categoryList">
            <!-- Table rows will be dynamically populated here -->
            <c:forEach var="row" items="${result.rows}">
                <c:if test="${row.ID!='6'}" >
        <tr>
            <td>${row.ID}</td>
            <td>${row.Name}</td>
            <td>${row.Email}</td>
            <td>${row.MobileNumber}</td>
            <td>${row.Address}</td>
            <td>${row.SecurityQuestion}</td>
            <td>${row.Status}</td>
        
        </tr>
        </c:if>
    </c:forEach>
        </tbody>
    </table>
</div>

    
    
<script>
    var textField = document.getElementById("name");

// Add event listener for the key press event
    textField.addEventListener("keyup", function(event) {
        var xy=document.getElementById("name").value;
//        select * from user where email like '%"+email+"%'
//        document.getElementById("ppp").innerHTML=xy;
            
            fetchUserData(xy);
    });
    function fetchUserData(keyword) {
    var xhr = new XMLHttpRequest();
    xhr.open("GET", "userSearchVerify?keyword=" + keyword, true);
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
            var responseData = JSON.parse(xhr.responseText);
            updateTable(responseData);
        }
    };
    xhr.send();
}

function updateTable(data) {
    var table = document.getElementById("categoryTable");
    var rowCount = table.rows.length;

    // Remove existing rows
    for (var i = rowCount - 1; i > 0; i--) {
        table.deleteRow(i);
    }
    
    data.forEach(function(user) {
        var row2 = table.insertRow();
//        document.getElementById("ppp").innerHTML=data;
        if(user.id!==6){
        row2.insertCell(0).textContent = user.id;
        row2.insertCell(1).textContent = user.name;
        row2.insertCell(2).textContent = user.email;
        row2.insertCell(3).textContent = user.mobileNumber;
        row2.insertCell(4).textContent = user.address;
        row2.insertCell(5).textContent = user.securityQuestion;
        row2.insertCell(6).textContent = user.status;
    }
    }
           
                );
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
    
    
    
    
    var rows = document.querySelectorAll('#categoryTable tr');

    // Loop through each row and add click event listener
    rows.forEach(function(row) {
    row.addEventListener('click', function() {
        var id = row.cells[6].textContent; // Assuming ID is in the first column
        var e2 = row.cells[2].textContent; 
        deleteRow(id,e2);
//        location.reload();
    });
});

function deleteRow(id,e2) {
            // Specify the URL of the servlet
            var servletURL = "statusChange"; // Update with your servlet URL

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
            
             var hiddenInput3 = document.createElement('input');
            hiddenInput3.type = 'hidden';
            hiddenInput3.name = 'email2'; // Replace with your parameter name if needed
            hiddenInput3.value = e2;
               
            // Append the hidden input field to the form
            form.appendChild(hiddenInput);
            form.appendChild(hiddenInput2);
            form.appendChild(hiddenInput3);

            // Append the form to the document body and submit it
            document.body.appendChild(form);
            form.submit();
        }

</script>

</body>
</html>

