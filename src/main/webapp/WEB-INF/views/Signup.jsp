<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Expense - Tracker : Signup</title>
</head>
<body>
	<h1>Sign Up Page</h1> <br>
	<form action="saveuser" method="post" enctype="multipart/form-data">
		First Name: 
		<input type="text" name="firstname"/> <br>
		Last Name: 
		<input type="text" name="lastname"/> <br>
		Email:
		<input type="email" name="email"/> <br>
		Password:
		<input type="password" name="password"/> <br>
		Gender:
		Male : <input type="radio" name="gender" value="male">
		Female : <input type="radio" name="gender" value="female">
		other : <input type="radio" name="gender" value="other">
		
		<br>
		Image : <input type="file" name="profilePic"/> <br>
		
		<a href="login">Already have an account? Login here</a> <br><br>
		
		<input type="submit" value="Signup"/>
		
	
			
	</form>
</body>
</html>