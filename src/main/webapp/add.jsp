<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Product</title>
<link rel="stylesheet" href="styles.css">
<style type="text/css">
	
	#result_container{
		margin: 5vh 0;
	}
	
	#result{
		color: green;
		font-size: 16px;
	}
	
	#add{
		background-color: green;
	}
	
	#navigate{
		margin: 3vh;
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
		<h3>Add Product</h3>
		<div id = "form">
			<form action="add" method = "post">
			
					<fieldset>
						<legend>Product Id</legend>
						<input type = "text" name = "Id" placeholder = "Enter Product Id">		
					</fieldset>
					
					<fieldset>
						<legend>Product Name</legend>
						<input type = "text" name = "Name" placeholder = "Enter Product Name">
					</fieldset>
					
					<fieldset>
						<legend>Product Brand</legend>
						<input type = "text" name = "Brand" placeholder = "Enter Product Brand">
					</fieldset>
					
					<fieldset>
						<legend>Product Category</legend>
						<input type = "text" name = "Category" placeholder = "Enter Product Category">
					</fieldset>
					
					<fieldset>
						<legend>Product Price</legend>
						<input type = "text" name = "Price" placeholder = "Enter Product Price">
					</fieldset>
					
					<div id="result_container">
						<h3 id="result"></h3>
					</div>
				<button type = "submit" id="add">Add</button>
			</form>
			
					<div id="navigate">
						<a href="index"><button>Home</button></a> <a href="view"><button>View All</button></a>
					</div>
			
		</div>
		
				<% String res = (String)request.getAttribute("data"); %>				
	</div>
	<script type="text/javascript">
	let message = `<%=res%>`;
	let clear = _=>document.getElementById("result").innerText = "";
	<%if(res!=null){ %>
		document.getElementById("result").innerText = message;
		setTimeout(clear, 3000);
	<% } %>
	</script>
	

</body>
</html>