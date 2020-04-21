<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="Controllers.DaoFacade"%>
<%@ page import="Models.Users"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Products</title>
</head>
<body onLoad="document.forms[0].submit()">
	<%
		DaoFacade df = new DaoFacade();

		ArrayList<Users> users = (ArrayList<Users>) df.readObject("customerAll", 0, response);

		session = request.getSession(false);
	%>

	Name :
	<%=session.getAttribute("name")%>
	<br>



	<table id="productTable" align="center" cellpadding="5" cellspacing="5"
		border="1">
		<tr>

		</tr>
		<tr bgcolor="#A52A2A">
			<td><b>ID</b></td>
			<td><b>Name</b></td>
			<td><b>Email</b></td>
			<td><b>Address</b></td>
		</tr>

		<%
			for (int i = 0; i < users.size(); i++) {
		%>
		<tr bgcolor="#DEB887">

			<td><%=users.get(i).getId()%></td>
			<td><%=users.get(i).getName()%></td>
			<td><%=users.get(i).getEmail()%></td>
			<td><%=users.get(i).getAddress()%></td>
			<td><a
				href='/SPassignment/View/updateCustomer.jsp?id=<%=users.get(i).getId()%>&mode='redirect';">
					Update Details</a></td>
			<td><a
				href='/SPassignment/View/OrderHistory.jsp?id=<%=users.get(i).getId()%>';">
					Order History</a></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>