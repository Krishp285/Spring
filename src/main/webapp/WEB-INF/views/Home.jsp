<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>Welcome to ExpenseTracker</h2>

${user.firstname} ${user.lastname}, you are logged in successfully!

<img src="${user.profilePicPath}"  style="width: 100px; height: 100px;">

</body>
</html>