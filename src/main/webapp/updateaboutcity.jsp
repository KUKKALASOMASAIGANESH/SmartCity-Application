<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<html>
<head>
<link type="text/css" rel="stylesheet" href="css/style.css">

<style>

table {
	width: 0px;
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

tr:nth-child(odd) {
	background-color: #f2f2f2;
}

#myTable {
	border-collapse: collapse;
	width: 10%;
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
	<div style="overflow-x: auto; width: 100%;">

		<table align=center border=2 id="myTable">
			<tr class="header">
				<th>ID</th>
				<th>CITY</th>
				<th>IMAGE 1</th>
				<th>DESCRIPTION</th>
				<th>CULTURE IMAGE</th>
				<th>CULTURE DESCRIPTION</th>
				
				<th>FESTIVAL IMAGE 1</th>
				<th>FESTIVAL IMAGE 2</th>
				<th>FESTIVAL IMAGE 3</th>
				
				<th>FAMOUS FOOD IMAGE 1</th>
				<th>FAMOUS FOOD IMAGE 2</th>
				<th>FAMOUS FOOD IMAGE 3</th>
				<th>FAMOUS FOOD IMAGE 4</th>
				<th>FAMOUS FOOD IMAGE 5</th>
				<th>FAMOUS FOOD IMAGE 6</th>
				
				<th>GALLERY IMAGE 1</th>
				<th>GALLERY IMAGE 2</th>
				<th>GALLERY IMAGE 3</th>
				
				<th>POLITICS IMAGE</th>
				<th>POLITICS DESC</th>
				<th>MAP LINK</th>
				<th>UPDATE</th>
			</tr>

			<c:forEach items="${aboutcitylist}" var="c">
				<tr>
					<td><c:out value="${c.id}" /></td>
					<td><c:out value="${c.city}" /></td>
					<td><img src='displaycityimage?id=${c.id}' width="10%" height="10%"></td>
					<td><c:out value="${c.description}" /></td>
					<td><img src='displaycitycultureimage?id=${c.id}' width="10%" height="10%"></td>
					<td><c:out value="${c.cultureDescription}" /></td>
					<td><img src='displaycityfestivalimage1?id=${c.id}' width="10%" height="10%"></td>
					<td><img src='displaycityfestivalimage2?id=${c.id}' width="10%" height="10%"></td>
					<td><img src='displaycityfestivalimage3?id=${c.id}' width="10%" height="10%"></td>
					
					<td><img src='displayfamousfoodimage1?id=${c.id}' width="10%" height="10%"></td>
					<td><img src='displayfamousfoodimage2?id=${c.id}' width="10%" height="10%"></td>
					<td><img src='displayfamousfoodimage3?id=${c.id}' width="10%" height="10%"></td>
					<td><img src='displayfamousfoodimage4?id=${c.id}' width="10%" height="10%"></td>
					<td><img src='displayfamousfoodimage5?id=${c.id}' width="10%" height="10%"></td>
					<td><img src='displayfamousfoodimage6?id=${c.id}' width="10%" height="10%"></td>
					
					<td><img src='displaygalleryimage1?id=${c.id}' width="10%" height="10%"></td>
					<td><img src='displaygalleryimage2?id=${c.id}' width="10%" height="10%"></td>
					<td><img src='displaygalleryimage3?id=${c.id}' width="10%" height="10%"></td>
					
					<td><img src='displaypoliticsimage?id=${c.id}' width="10%" height="10%"></td>
					<td><c:out value="${c.politicsDescription}" /></td>
					<td><c:out value="${c.maplink}" /></td>
					
					<td><a href='<c:url value="updateaboutcitybyid?id=${c.id}"></c:url>'>Update</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>
