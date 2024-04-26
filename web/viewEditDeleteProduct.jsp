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
.gtgt{
    color: orange;
}
.pdd{
    margin-top: 5px;
    /*padding-right: 100px;*/
    width: 100%;
    padding-left: 20px;
    padding-right: 20px;
}
.pdd1{
    display: flex;
    margin: 15px;
    /*padding-right: 100px;*/
}
.may{
 
    width: 100%;
    padding-left: 15px;
    padding-right: 15px;
    display: flex;
    flex-direction: row;
    height: 100%;
    /*background-color: white;*/
}
.w30{
    width:30%;
}
.w40{
    width:40%;
    padding-left: 15px;
    padding-right: 15px;
}
.w100{
    width:100%;
    height: 100vh;
    justify-content: center;
    align-items: center;
}
.w50{
    width: 50%;
    margin: 150px 40px 0px 40px;
}
.w501{
    width: 50%;
    margin: 130px 40px 0px 40px;
}
.table-container {
    margin-top: 15px;
        width: 95%; /* Adjust width as needed */
        height: 300px; /* Adjust height as needed */
        overflow: auto; /* Add scrollbars when content exceeds container size */
        
    }
th, td {
        text-align: center; /* Horizontally center the content */
        vertical-align: middle; /* Vertically center the content */
    }


</style>
</head>
<body>
    <sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver"
                    url="jdbc:mysql://localhost:3306/cms"
                    user="root" password="mayur013" />

<sql:query var="result" dataSource="${dataSource}">
    select * from product;
</sql:query>
<sql:query var="result1" dataSource="${dataSource}">
    select * from catagory;
</sql:query>
    

<div class="pdd form-group row d-flex justify-content-between ">
    
    <h1 class="cco">View, Edit, Delete Product</h1>
    <button class="btn btn-danger" onclick="redirectToMainPage()">Back</button>
    
</div>
    <div class="may">
        <div class="w50">
            <div class=" row cco">
                <label for="billid" class="col-sm-3 col-form-label">ID:</label>
                <label for="bill" id="Id" class="col-sm-3 col-form-label">00</label>
            </div>
<!--            <div class=" cco">
                <label for="cust" class=" col-form-label">Customer Details:</label>
            </div>-->
                
            <div class="form-group row cco">
                <label for="name" class="col-sm-3 col-form-label">Name:</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="name" name="name" placeholder="Name" required>
                </div>    
            </div>
            <div class="form-group row cco">
                <label for="category" class="col-sm-3 col-form-label">Category:</label>
                <div class="col-sm-9">
                    <select id="category" class="form-control" name="category">
                        
                        <c:forEach var="row" items="${result1.rows}">
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
               <div class="form-group row  mx-auto">
                   <label for="price" class="col-sm-3 col-form-label"></label>
                   <div class="col-sm-9 d-flex justify-content-between">
                       <button id="update" onclick="redirectToUpdateProduct()" class="btn btn-primary " disabled >Update</button>
                       <button id="delete" onclick="redirectToDeleteProduct()" class="btn btn-danger " disabled>Delete</button>
                     <button  class="btn btn-secondary " onclick="clearFields()" >Clear</button>
                    </div>
                   
             </div>
        </div>
        <div class="w501">
            <div class="form-group cco">
                <label for="category" class="col-sm-7 col-form-label">Products:</label>
                </div>
                <div class="table-container">
                    <table id="categoryTable" class="table table-hover table-bordered tblCl" border="2 solid">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Category</th>
                                <th>Price</th>
                                
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="row" items="${result.rows}">
                                <tr>
                                    <td>${row.Id}</td>
                                    <td>${row.Name}</td>
                                    <td>${row.Catagory}</td>
                                    <td>${row.Price}</td>
                                    <!-- Retrieve more columns as needed -->
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            
        </div>
       
        
    </div>


    
    
<script>
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
    // Get all input fields
    const inputFields = document.querySelectorAll('input[type="text"]');
    
    // Iterate over each input field
    inputFields.forEach(function(input) {
        // Set the value of the input field to an empty string
        input.value = '';
    });
}


var rows = document.querySelectorAll('#categoryTable tbody tr');
const pname=document.getElementById("name");
const pcatagory=document.getElementById("category");
const pprice=document.getElementById("price");
const plabel=document.getElementById("Id");
const updateBtn=document.getElementById("update");
const deleteBtn=document.getElementById("delete");
//addTo.disabled = true;
    // Loop through each row and add click event listener
    rows.forEach(function(row) {
    row.addEventListener('click', function() {
        const id=parseInt(row.cells[0].textContent);
        var name = row.cells[1].textContent; // Assuming ID is in the first column
        var cat=row.cells[2].textContent;
        const price = parseInt(row.cells[3].textContent);
        updateBtn.disabled=false;
        deleteBtn.disabled=false;


    plabel.textContent=id;
    pname.value=name;
    pprice.value=price;
    for (let option of pcatagory.options) {
            if (option.value === cat) {
                option.selected = true;
                break;
            }
        }

    });
});
pname.addEventListener('input', toggleButtonState);
pprice.addEventListener('input', toggleButtonState);

function toggleButtonState() {
    // Check if any of the input fields are empty
    const isEmpty = !pname.value || !pprice.value ;
    
    // Disable or enable the button based on the input fields' values
    updateBtn.disabled = isEmpty;
    deleteBtn.disabled=isEmpty;
}

function redirectToUpdateProduct() {
            // Specify the URL of the servlet
            var servletURL = "updateProduct"; // Update with your servlet URL
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
            
            var hiddenInput1 = document.createElement('input');
            hiddenInput1.type = 'hidden';
            hiddenInput1.name = 'name'; // Replace with your parameter name if needed
            hiddenInput1.value = pname.value; // Replace with your parameter value if needed
            
            var hiddenInput2 = document.createElement('input');
            hiddenInput2.type = 'hidden';
            hiddenInput2.name = 'category'; // Replace with your parameter name if needed
            hiddenInput2.value = pcatagory.value; // Replace with your parameter value if needed
            
            var hiddenInput3 = document.createElement('input');
            hiddenInput3.type = 'hidden';
            hiddenInput3.name = 'id'; // Replace with your parameter name if needed
            hiddenInput3.value = plabel.textContent; // Replace with your parameter value if needed
            
            var hiddenInput4 = document.createElement('input');
            hiddenInput4.type = 'hidden';
            hiddenInput4.name = 'price'; // Replace with your parameter name if needed
            hiddenInput4.value = pprice.value; // Replace with your parameter value if needed
            
            // Append the hidden input field to the form
            form.appendChild(hiddenInput);
            form.appendChild(hiddenInput1);
            form.appendChild(hiddenInput2);
            form.appendChild(hiddenInput3);
            form.appendChild(hiddenInput4);

            // Append the form to the document body and submit it
            document.body.appendChild(form);
            form.submit();
        }
        
function redirectToDeleteProduct() {
            // Specify the URL of the servlet
            var servletURL = "deleteProduct"; // Update with your servlet URL
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
            
            
            var hiddenInput3 = document.createElement('input');
            hiddenInput3.type = 'hidden';
            hiddenInput3.name = 'id'; // Replace with your parameter name if needed
            hiddenInput3.value = plabel.textContent; // Replace with your parameter value if needed
            
            
            // Append the hidden input field to the form
            form.appendChild(hiddenInput);
            form.appendChild(hiddenInput3);

            // Append the form to the document body and submit it
            document.body.appendChild(form);
            form.submit();
        }

</script>

</body>
</html>

