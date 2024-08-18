<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product Management System</title>
<link rel="stylesheet" href="styles.css">
<style type="text/css">
	#navigate{
		width: 70%;
		margin: 3vh auto;
		display: flex;
		justify-content: space-around;
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
		<div id="navigate">
			<a href="addpage"><button>Add Product</button></a> <a href="view"><button>View Product List</button></a>
		</div>
	</div>
</body>
</html>