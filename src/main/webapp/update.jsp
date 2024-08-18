<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Product</title>
<link rel="stylesheet" href="styles.css">
<style type="text/css">
	#update{
		background-color: blue;
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
	<div>
		<h3>Update Product</h3>
		<div id = form>
			<% ResultSet res = (ResultSet)request.getAttribute("data"); %>
			
			<form action="updaterec" method = "post">
			<%if(res.next()){ %>
				<fieldset>
						<legend>Product Id</legend>
						<input type = "text" name = "Id" value = "<%= res.getInt(1)%>" readonly>
					</fieldset>
					
					<fieldset>
						<legend>Product Name</legend>
						<input type = "text" name = "Name" value = "<%= res.getString(2)%>">
					</fieldset>
					
					<fieldset>
						<legend>Product Brand</legend>
						<input type = "text" name = "Brand" value = "<%= res.getString(3)%>">
					</fieldset>
					
					<fieldset>
						<legend>Product Category</legend>
						<input type = "text" name = "Category" value = "<%=res.getString(4)%>">
					</fieldset>
					
					<fieldset>
						<legend>Product Price</legend>
						<input type = "text" name = "Price" value = "<%= res.getDouble(5)%>">
					</fieldset>
				<button type = "submit" id="update">Update</button>
			<%} %>
			</form>
		</div>	
		
		<div id = "navigate">
				<a href="view"><button>Go Back</button></a>
		</div>
		
	</div>
</body>
</html>