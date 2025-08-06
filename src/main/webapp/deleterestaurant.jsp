<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<html>
<head>
    <link type="text/css" rel="stylesheet" href="css/style.css">

    <style>
      
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            color: black;
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

        h3 {
            text-align: center;
            margin: 20px 0;
        }

        .btn-delete {
            background-color: #FF4500;
            color: #fff;
            padding: 5px 10px;
            text-decoration: none;
            border-radius: 5px;
        }

        .btn-delete:hover {
            background-color: #FF6347;
        }

        /* Style for the header and navigation bar */
        body {
            font-family: Arial, sans-serif;
            background-color: #333;
            color: #fff;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            padding: 20px 0;
        }

        ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            background-color: #222;
        }

        li {
            margin: 0;
            padding: 0;
        }

        li a {
            display: block;
            color: #fff;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        li a:hover {
            background-color: #555;
        }
    </style>
</head>
<body>
    

    <%@ include file="adminnavbar.jsp" %>
<header>
        <h1>Delete Restaurant</h1>
    </header>
    <div style="overflow-x: auto; width: 100%;">
        <table>
            <tr>
                <th>ID</th>
                <th>City</th>
                <th>Name</th>
                <th>Description</th>
                 <th>Link</th>
                <th>Image</th>
                <th>DELETE</th>
            </tr>

            <c:forEach items="${rlist}" var="c">
                <tr>
                    <td><c:out value="${c.id}" /></td>
                    <td><c:out value="${c.city}" /></td>
                    <td><c:out value="${c.name}" /></td>
                    <td><c:out value="${c.description}" /></td>
                    <td><c:out value="${c.link}" /></td>
                    <td><img src='displayrestaurantimage?id=${c.id}' width="10%" height="10%"></td>
                    <td>
                        <a href='<c:url value="deleterestaurantbyid?id=${c.id}"></c:url>' class="btn-delete">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
