<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="Controllers.DaoFacade"%>
<%@ page import="Models.Items"%>
<%@ page import="Controllers.productState"%>
<%@ page import="Controllers.NullObject"%>




<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Products</title>
</head>
<body onLoad="document.forms[0].submit()">
	<%
		DaoFacade fb = new DaoFacade();
		NullObject n = new NullObject();
			ArrayList<Items> items =(ArrayList<Items>) fb.readObject("itemAll", 0, response);
			productState ps = new productState();
			String name = (String) session.getAttribute("name");

			session = request.getSession(false);
			
			if(session.toString().equals(null)){
				n.redirect(response);
			}
	%>

	Session ID :
	<%=session.getAttribute("name")%>  --%>
	<br>

	<%
		if (session.getAttribute("accountType").equals("admin")) {
	%>
	<a href="Admin.jsp">Admin</a>
	<%
		}
	%>

	<br> Enter the name of the product you would like to search for:
	<br>
	<input type="text" id="myInput" onkeyup="refineSearch()"
		placeholder="Search for product" title="Search for product">

	<table id="productTable" align="center" cellpadding="5" cellspacing="5"
		border="1">
		<tr>

		</tr>
		<tr bgcolor="#A52A2A">
			<td><b>SKU</b></td>
			<td><b>Name</b></td>
			<td><b>Manufacturer</b></td>
			<td><b>Price</b></td>
			<td><b>Category</b></td>
			<td><b>Image</b></td>
			<td><b>Stock:</b></td>
		</tr>

		<%
			for (int i = 0; i < items.size(); i++) {
		%>
		<tr bgcolor="#DEB887">

			<td><%=items.get(i).getSku()%></td>
			<td><a
				href="viewProduct.jsp?id=<%=items.get(i).getSku()%>&mode=redirect';"><%=items.get(i).getName()%></a></td>
			<td><%=items.get(i).getManufacturer()%></td>
			<td><%=items.get(i).getPrice()%></td>
			<td><%=items.get(i).getCategory()%></td>
			<td><img
				src="/SPassignment/spAssets/<%=items.get(i).getImagePath()%>"
				style="width: 150px; height: 150px;"></td>
			<td><%=ps.checkState("stock", items.get(i).getSku(), response)%></td>

		</tr>
		<%
			}
		%>
	</table>

	<script>
		function refineSearch() {
			var input, filter, table, tr, td, i, txtValue;
			input = document.getElementById("myInput");
			filter = input.value.toUpperCase();
			table = document.getElementById("productTable");
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