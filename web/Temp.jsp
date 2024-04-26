<%-- 
    Document   : Temp
    Created on : 16-Apr-2024, 6:36:13 pm
    Author     : mayur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Click Table Row</title>
<style>
    table {
        border-collapse: collapse;
        width: 100%;
    }
    th, td {
        border: 1px solid #dddddd;
        text-align: left;
        padding: 8px;
    }
    tr:hover {
        background-color: #f2f2f2;
    }
</style>
</head>
<body>
    <!--<p id="ppp"></p>-->
<table id="myTable">
  <tr>
    <th>Firstname</th>
    <th>Lastname</th>
    <th>Age</th>
  </tr>
  <tr>
    <td>John</td>
    <td>Doe</td>
    <td>30</td>
  </tr>
  <tr>
    <td>Jane</td>
    <td>Doe</td>
    <td>25</td>
  </tr>
</table>

<script>
    var userEmail ="<%= request.getParameter("email")%>";
//    document.getElementById("ppp").innerHTML=userEmail;
    // Get all table rows
    var rows = document.querySelectorAll('#myTable tr');

    // Loop through each row and add click event listener
    rows.forEach(function(row) {
        row.addEventListener('click', function() {
            // Do something when row is clicked
            alert('You clicked on: ' + this.innerText);
        });
    });
</script>

</body>
</html>


