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

<div class="pdd form-group row d-flex justify-content-between ">
    
    <h1 class="cco">Place Order</h1>
    <button class="btn btn-danger" onclick="redirectToMainPage()">Back</button>
    
</div>
    <div class="may">
        <div class="w30">
<!--            <div class=" row cco">
                <label for="billid" class="col-sm-3 col-form-label">Bill ID:</label>
                <label for="bill" class="col-sm-3 col-form-label">--</label>
            </div>-->
            <div class=" cco">
                <label for="cust" class=" col-form-label">Customer Details:</label>
            </div>
                
            <div class="form-group cco">
                <label for="name" class="col-sm-3 col-form-label">Name:</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="name" name="name" placeholder="Name" required>
                </div>    
            </div>
            <div class="form-group cco">
                <label for="mobile" class="col-sm-7 col-form-label">Mobile Number:</label>
                <div class="col-sm-9">
                    <input type="text" maxlength="10" minlength="10" class="form-control" id="mobile" name="mobile" placeholder="Mobile" required>
                </div>    
            </div>
            <div class="form-group cco">
                <label for="email" class="col-sm-3 col-form-label">Email:</label>
                <div class="col-sm-9">
                    <input type="email" class="form-control" id="email" name="email" placeholder="Email" required>
                </div>    
            </div>
        </div>
        <div class="w30">
            <div class="form-group cco">
                <label for="category" class="col-sm-7 col-form-label">Products:</label>
                </div>
                <div class="table-container">
                    <table id="categoryTable" class="table table-hover table-bordered tblCl" border="2 solid">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Category</th>
                                <th>Price</th>
                                
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="row" items="${result.rows}">
                                <tr>
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
        <div class="w40 ">
            
                <div class="form-group row">
                <label for="name2" class="col-sm-2 col-form-label cco">Name:</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="name2" name="name2"  readonly>
                </div>
                
            </div>
                <div class="form-group row">
                <label for="price2" class="col-sm-2 col-form-label cco">Price:</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="price2" name="price2" readonly>
                </div>
                
            </div>
                <div class="form-group row">
                <label for="quantity" class="col-sm-2 col-form-label cco">Quantity:</label>
                <div class="col-sm-9">
                    <input type="number" class="form-control" id="quantity" name="quantity" value="1" min="1">
                </div>
                
            </div>
                <div class="form-group row">
                <label for="total" class="col-sm-2 col-form-label cco">Total:</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="total" name="total" readonly>
                </div>
                
            </div>
             <div class="form-group row d-flex justify-content-end mx-auto">
                 <button id="press" class="btn btn-secondary" onclick="generateB()" >Add To Cart</button>
                  <!--<p id="ppp">hiii</p>-->
             </div>
            
            <div class="table-container">
                    <table id="categoryTable1" class="table table-hover table-bordered tblCl" border="2 solid">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Total</th>
                                
                            </tr>
                        </thead>
                    </table>
                </div>
            <div class="form-group row d-flex justify-content-between mx-auto">
                <div class=" row cco">
                <label for="gt" class=" col-form-label gtgt">Grand Total:    </label>
                <label id="gtt" class=" col-form-label ">00</label>
            </div>
                <button id="generateBill" disabled onclick="sendTableDataToServlet()" class="btn btn-primary" >Generate Bill</button>
                
            </div>
        </div>
        
    </div>


    
    
<script>
    var totalGrandTotal=0;
    
    
    document.getElementById("mobile").addEventListener("input", function() {
  this.value = this.value.replace(/[^0-9]/g, ''); // Allow only numeric characters
  if (this.value.length > 10) {
    this.value = this.value.slice(0, 10); // Limit the length to 10 characters
  }
});



var rows = document.querySelectorAll('#categoryTable tbody tr');
const productNameInput = document.getElementById("name2");
const glabel = document.getElementById("gtt");
const productPriceInput = document.getElementById("price2");
const productQuantityInput = document.getElementById("quantity");
const productTotalInput = document.getElementById("total");
const addTo = document.getElementById("press");
//addTo.disabled = true;
    // Loop through each row and add click event listener
    rows.forEach(function(row) {
    row.addEventListener('click', function() {
        var name = row.cells[0].textContent; // Assuming ID is in the first column
        const price = parseInt(row.cells[2].textContent);
    const quantity = parseInt(productQuantityInput.value);
    const total = price * quantity;

    // Set data to form fields
    productNameInput.value = name;
    productPriceInput.value = price;
    productTotalInput.value = total;

    });
});

    
    
    
productQuantityInput.addEventListener("change", () => {
  const price = parseInt(productPriceInput.value);
  const quantity = parseInt(productQuantityInput.value);
  const total = price * quantity;
  productTotalInput.value = total;
});


 function generateB() {
    // Retrieve values from form fields
    const name = document.getElementById('name2').value;
    const btng=document.getElementById("generateBill");
    const price = parseInt(document.getElementById('price2').value);
    const quantity = parseInt(document.getElementById('quantity').value);
    const total = parseInt(document.getElementById('total').value);
    if(name!==''){
        btng.disabled=false;
//        alert("hjh");
        totalGrandTotal+=total;
        glabel.textContent=totalGrandTotal;
//        console.log('Name:', name);
//console.log('Price:', price);
//console.log('Quantity:', quantity);
//console.log('Total:', total);
//    document.getElementById("ppp").innerHTML=name+price+quantity+total;

    // Create a new row for the cart table
//    const newRow = document.createElement('tr');
//
//    // Add cells for each field
     const newRow = document.createElement('tr');
//
//        // Create and append cells for each field
        const nameCell = document.createElement('td');
        nameCell.textContent = name;
        newRow.appendChild(nameCell);
//
        const priceCell = document.createElement('td');
        priceCell.textContent = price;
        newRow.appendChild(priceCell);

        const quantityCell = document.createElement('td');
        quantityCell.textContent = quantity;
        newRow.appendChild(quantityCell);

        const totalCell = document.createElement('td');
        totalCell.textContent = total;
        newRow.appendChild(totalCell);

    // Append the new row to the cart table
    document.getElementById('categoryTable1').appendChild(newRow);
}
}

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
    
    
function sendTableDataToServlet() {
    // Retrieve the table element
    const table = document.getElementById('categoryTable1');

    // Initialize an array to store table data
    const tableData = [];

    // Iterate over rows in the table
    for (let i = 1; i < table.rows.length; i++) {
        const row = table.rows[i];
        const rowData = {};

        // Iterate over cells in the row
        var name4 = row.cells[0].innerText;
        var price4 = row.cells[1].innerText;
        var quantity4 = row.cells[2].innerText;
        var total4 = row.cells[3].innerText;

        // Add data to the JSON object
        rowData["Name"] = name4;
        rowData["Price"] = price4;
        rowData["Quantity"] = quantity4;
        rowData["Total"] = total4;

        // Add the row data to the array
        tableData.push(rowData);
    }

    // Convert table data to JSON string
    const jsonData = JSON.stringify(tableData);

    // Create query parameters
    const params = {
        email: "<%= request.getParameter("email")%>",
        name: document.getElementById("name").value,
        mobile: document.getElementById("mobile").value,
        cemail:document.getElementById("email").value,
        gtl:document.getElementById("gtt").textContent
        // Add more key-value pairs as needed
    };

    // Convert query parameters to URL-encoded string
    const queryParams = new URLSearchParams(params).toString();

    // Append query parameters to servlet URL
    const servletUrl = 'placeOrder?' + queryParams;

    // Send JSON data to servlet using AJAX
    const xhr = new XMLHttpRequest();
    xhr.open('POST', servletUrl, true);
    xhr.setRequestHeader('Content-Type', 'application/json');
//    alert("hiii");
    xhr.send(jsonData);
    
}


</script>

</body>
</html>

