<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <%@ taglib uri="jakarta.tags.core" prefix="c"%>
 --%>
<html>
<head>
<link type="text/css" rel="stylesheet" href="css/style.css">

    <style>
       
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
                        color: black; /* Set text color to black */
            
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 15px;
            text-align: left;
        }

        th {
            background-color: #333;
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>

    <%@ include file="adminnavbar.jsp" %>
<html>
<head>
    <title>All Customers</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
<h2>All Customers</h2>
<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Username</th>
        <th>Email</th>
        <th>Contact</th>
        <th>Gender</th>
        <th>DOB</th>
        <th>Address</th>
        <th>Active</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="c" items="${customerdata}">
        <tr>
            <td>${c.id}</td>
            <td>${c.name}</td>
            <td>${c.username}</td>
            <td>${c.email}</td>
            <td>${c.contactno}</td>
            <td>${c.gender}</td>
            <td>${c.dob}</td>
            <td>${c.address}</td>
            <td>${c.active}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
