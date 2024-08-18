<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Product Table</title>
<link rel="stylesheet" href="styles.css">
<style type="text/css">

	#update{
		background-color: blue;
	}
	
	#delete{
		background-color: red;
	}
	
	#result_container{
		margin: 5vh 0;
	}
	
	#result{
		color: red;
		font-size: 16px;
	}
	

	#navigate{
		margin: 3vh;
		text-align: center;
	}
	
	#navigate button{
		background-color: #b317e3;
	}
</style>
</head>
<body>
	<header>
		<h1>Product Management System</h1>
	</header>
	
	<h3>Products</h3>
	
	<table>
		<thead>
			<tr>
				<th>ID</th>
				<th>NAME</th>
				<th>BRAND</th>
				<th>CATEGORY</th>
				<th>PRICE</th>
				<th>ACTION</th>
			</tr>
		</thead>
		<tbody>
			<% ResultSet res = (ResultSet)request .getAttribute("data");
				while(res.next()){%>
				<tr>
					<td><%=res.getInt(1)%></td>
					<td><%=res.getString(2)%></td>
					<td><%=res.getString(3)%></td>
					<td><%=res.getString(4)%></td>
					<td><%=res.getDouble(5)%></td>
					<td><a href="update?id=<%= res.getInt(1) %>"><button id="update">Update</button></a><a href="delete?id=<%= res.getInt(1) %>"><button id="delete">Delete</button></a></td>
				</tr>
				
			<%	} %>
		</tbody>
	</table>
	
	<div id="result_container">
		<h3 id="result"></h3>
	</div>
			<div id = "navigate"><a href="index"><button>Home</button></a></div>
	
	<%String del = (String)request.getAttribute("del"); %>
	
		<script type="text/javascript">
	let message = `<%=del%>`;
	let clear = _=>document.getElementById("result").innerText = "";
	<%if(del!=null){ %>
		document.getElementById("result").innerText = message;
		setTimeout(clear, 3000);
	<% } %>
	</script>
</body>
</html>