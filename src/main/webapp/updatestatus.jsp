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

        .btn-active, .btn-inactive {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007BFF;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
        }

        .btn-active:hover, .btn-inactive:hover {
            background-color: #0056b3;
        }

        .status-active {
            background-color: green;
            color: #fff;
        }

        .status-inactive {
            background-color: red;
            color: #fff;
        }

        .blink {
            animation: blinker 1s linear infinite;
        }

        @keyframes blinker {
            50% {
                opacity: 0;
            }
        }
    </style>
</head>
<body>
   

    <%@ include file="adminnavbar.jsp" %>
 <header>
        <h1>Update Status</h1>
    </header>
    <div style="overflow-x: auto; width: 100%;">
        <span class="blink">
            <h3 style="color: red; text-align: center;">${message}</h3>
        </span>

       
      
        <table>
            <tr>
                <th>ID</th>
                <th>NAME</th>
                <th>UserName</th>
                <th>Email</th>
                <th>Gender</th>
                <th>DOB</th>
                <th>Address</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>

            <c:forEach items="${customerdata}" var="c">
                <tr>
                    <td><c:out value="${c.id}" /></td>
                    <td><c:out value="${c.name}" /></td>
                    <td><c:out value="${c.username}" /></td>
                    <td><c:out value="${c.email}" /></td>
                    <td><c:out value="${c.gender}" /></td>
                    <td><c:out value="${c.dob}" /></td>
                    <td><c:out value="${c.address}" /></td>
                    <td class="<c:if test='${c.active == true}'>status-active</c:if><c:if test='${c.active == false}'>status-inactive</c:if>">
                        <c:out value="${c.active == true ? 'ACTIVE' : 'INACTIVE'}" />
                    </td>
                    <td>
                        <a href='<c:url value="setstatus?id=${c.id}&status=true"></c:url>' class="btn-active">Active</a>
                        <a href='<c:url value="setstatus?id=${c.id}&status=false"></c:url>' class="btn-inactive">Inactive</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
