<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

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
		<h1>City Details</h1>
	</header>
	<div class="container">

		<table align=center border=2 id="myTable">
			<tr class="header">
				<th>ID</th>
				<th>CITY</th>
				<th>CITY NAME</th>
				<th>IMAGE 1</th>
				<th>IMAGE 2</th>
				<th>UPDATE</th>
			</tr>

			<c:forEach items="${citieslist}" var="c">
				<tr>
					<td><c:out value="${c.id}" /></td>
					<td><c:out value="${c.city}" /></td>
					<td><c:out value="${c.citynamestyle}" /></td>
					<td><img src='displaycityimage1?id=${c.id}' width="10%" height="10%"></td>
					<td><img src='displaycityimage2?id=${c.id}' width="10%" height="10%"></td>
					<td><a href='<c:url value="updatecitybyid?id=${c.id}"></c:url>'>Update</a></td>
                        
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>
