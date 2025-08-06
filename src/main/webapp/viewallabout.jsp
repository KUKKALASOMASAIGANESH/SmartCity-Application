<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%-- <%@ taglib uri="jakarta.tags.core" prefix="c"%>
 --%>
<html>
<head>
<link type="text/css" rel="stylesheet" href="css/style.css">
<script>
function myFunction() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[2];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
</script>

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
	<div class="container">

		<table align=center border=2 id="myTable">
			<tr class="header">
				<th>ID</th>
				<th>CITY</th>
				<th>CITY NAME</th>
				<th>IMAGE 1</th>
								<th>CULTURE IMAGE</th>
				
				<th>FESTIVAL IMAGE 1</th>
				<th>FAMOUS FOOD IMAGE 1</th>
								<th>POLITICS IMAGE</th>
				
				
				
			</tr>

			<c:forEach items="${aboutlist}" var="c">
				<tr>
					<td><c:out value="${c.id}" /></td>
					<td><c:out value="${c.city}" /></td>
					<td><c:out value="${c.cname}" /></td>
					<td><img src='displaycityimage?id=${c.id}' width="10%" height="10%"></td>					
										<td><img src='displaycitycultureimage?id=${c.id}' width="10%" height="10%"></td>
					
					<td><img src='displaycityfestivalimage1?id=${c.id}' width="10%" height="10%"></td>				
					<td><img src='displayfamousfoodimage1?id=${c.id}' width="10%" height="10%"></td>
									<td><img src='displaypoliticsimage?id=${c.id}' width="10%" height="10%"></td>
				
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>
