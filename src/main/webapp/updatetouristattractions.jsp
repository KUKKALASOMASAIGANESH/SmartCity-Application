<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

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
	<div style="overflow-x: auto; width: 100%;">

		<table align=center border=2 id="myTable">
			<tr class="header">
				<th>ID</th>
				<th>CITY</th>
				<th>CENTRAL IMAGE</th>
				
				<th>TA IMAGE 1</th>
				<th>TA NAME 1</th>
				<th>TA DESC 1</th>
				<th>TA LINK 1</th>
				
				<th>TA IMAGE 2</th>
				<th>TA NAME 2</th>
				<th>TA DESC 2</th>
				<th>TA LINK 2</th>
				
				<th>TA IMAGE 3</th>
				<th>TA NAME 3</th>
				<th>TA DESC 3</th>
				<th>TA LINK 3</th>
				
				<th>TA IMAGE 4</th>
				<th>TA NAME 4</th>
				<th>TA DESC 4</th>
				<th>TA LINK 4</th>
				
				<th>TA IMAGE 5</th>
				<th>TA NAME 5</th>
				<th>TA DESC 5</th>
				<th>TA LINK 5</th>
				
				<th>TA IMAGE 6</th>
				<th>TA NAME 6</th>
				<th>TA DESC 6</th>
				<th>TA LINK 6</th>
				
				<th>UPDATE</th>
				
			</tr>

			<c:forEach items="${talist}" var="c">
				<tr>
					<td><c:out value="${c.id}" /></td>
					<td><c:out value="${c.city}" /></td>
					
					<td><img src='displaycentralimage?id=${c.id}' width="10%" height="10%"></td>
					
					<td><img src='touristattractionimg1?id=${c.id}' width="10%" height="10%"></td>					
					<td><c:out value="${c.taname1}" /></td>
					<td><c:out value="${c.tadesc1}" /></td>
					<td><c:out value="${c.talink1}" /></td>
					
					<td><img src='touristattractionimg2?id=${c.id}' width="10%" height="10%"></td>					
					<td><c:out value="${c.taname2}" /></td>
					<td><c:out value="${c.tadesc2}" /></td>
					<td><c:out value="${c.talink2}" /></td>
					
					<td><img src='touristattractionimg3?id=${c.id}' width="10%" height="10%"></td>					
					<td><c:out value="${c.taname3}" /></td>
					<td><c:out value="${c.tadesc3}" /></td>
					<td><c:out value="${c.talink3}" /></td>
					
					
					<td><img src='touristattractionimg4?id=${c.id}' width="10%" height="10%"></td>					
					<td><c:out value="${c.taname4}" /></td>
					<td><c:out value="${c.tadesc4}" /></td>
					<td><c:out value="${c.talink4}" /></td>
					
					<td><img src='touristattractionimg5?id=${c.id}' width="10%" height="10%"></td>					
					<td><c:out value="${c.taname5}" /></td>
					<td><c:out value="${c.tadesc5}" /></td>
					<td><c:out value="${c.talink5}" /></td>
					
					<td><img src='touristattractionimg6?id=${c.id}' width="10%" height="10%"></td>					
					<td><c:out value="${c.taname6}" /></td>
					<td><c:out value="${c.tadesc6}" /></td>
					<td><c:out value="${c.talink6}" /></td>		
					
					<td><a href='<c:url value="updatetabyid?id=${c.id}"></c:url>'>Update</a></td>
							
					
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>
