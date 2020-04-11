<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="SPassignment.SQLConnection"%>
<%@ page import="SPassignment.Items"%>
<%@ page import="SPassignment.Landing"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Search</title>
</head>
<body>

</head>
<body onLoad="document.forms[0].submit()">
	<%
		SQLConnection fb = new SQLConnection();
		ArrayList<Items> items = fb.getItems();
		Landing l = new Landing();
		String name = l.getUsername();

		session = request.getSession(false);
	%>

	Session ID :
	<%=session.getAttribute("name")%>
<br>
<br>

	Enter the name of the product you would like to search for:
	<br>
	<input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for product" title="Search for product">
<table id="myTable">
  <tr class="header">
    <tr bgcolor="#A52A2A">
			<td><b><button">SKU</button></b></td>
			<td><b><button ">Name</button></b></td>
			<td><b><button">Manufacturer</button></b></td>
			<td><b><button">Price</button></b></td>
			<td><b><button">Category</button></b></td>
			<td><b>Image</b></td>
		</tr>
  </tr>
<%
			for (int i = 0; i < items.size(); i++) {
		%>
		<tr bgcolor="#DEB887">

			<td><%=items.get(i).getSku()%></td>
			<td><%=items.get(i).getName()%></td>
			<td><%=items.get(i).getManufacturer()%></td>
			<td><%=items.get(i).getPrice()%></td>
			<td><%=items.get(i).getCategory()%></td>
			<td><img
				src="C:/Users/whitec/Desktop/spAssets/<%=items.get(i).getImagePath()%>"
				style="width: 150px; height: 150px;"></td>
				<td><button onclick="window.location.href = 'update.jsp?id=<%=items.get(i).getSku()%>';">Update Details</button></td>
		</tr>
		<%
			}
		%>
	</table>
	
<script>
function myFunction() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[1];
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

</body>
</html>