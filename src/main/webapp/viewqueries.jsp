<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%-- <%@ taglib uri="jakarta.tags.core" prefix="c"%>
 --%>
<html>
<head>
<link type="text/css" rel="stylesheet" href="css/style.css">
<style>
table {
	width: auto;
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

#myTable {
	border-collapse: collapse;
	width: 100%;
	border: 1px solid #ddd;
	font-size: 18px;
}

#myTable img {
  width: 100px;
  height: 100px;
}

#myTable td:nth-child(4), #myTable td:nth-child(5) {
  padding: 5px;
}
</style>
</head>
<body>

	<%@ include file="adminnavbar.jsp"%>
	<header>
		<h1>Queries</h1>
	</header>
	<div style="overflow-x: auto; width: 100%;">

		<table align=center border=2 id="myTable">
			<tr class="header">
				<th>Id</th>
				<th>Name</th>
				<th>Email</th>
				<th>Comment</th>
				<th>Delete</th>
			</tr>

			<c:forEach items="${clist}" var="c">
				<tr>
					<td><c:out value="${c.id}" /></td>
					<td><c:out value="${c.name}" /></td>
					<td><c:out value="${c.email}" /></td>
					<td><c:out value="${c.comment}" /></td>
					  <td>
                        <a href='<c:url value="deletequerybyid?id=${c.id}"></c:url>' class="btn-delete">Delete</a>
                    </td>
					</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>
