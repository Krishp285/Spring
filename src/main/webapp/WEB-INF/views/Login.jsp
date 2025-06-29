<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Login - ExpenseTracker</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">

<style>

body {

background-color: #f4f7f6;

font-family: 'Arial', sans-serif;

}

.container {

max-width: 400px;

background-color: #ffffff;

padding: 30px;

border-radius: 10px;

box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);

margin-top: 100px;

}

h2 {

color: #2e7d32;

font-weight: bold;

margin-bottom: 20px;

}

.form-label {

color: #424242;

font-weight: 500;

}

.btn-primary {

background-color: #2e7d32;

border-color: #2e7d32;

padding: 10px 20px;

font-size: 16px;

transition: background-color 0.3s;

}

.btn-primary:hover {

background-color: #1b5e20;

border-color: #1b5e20;

}

.form-control {

border-color: #bdbdbd;

border-radius: 5px;

}

.form-control:focus {

border-color: #2e7d32;

box-shadow: 0 0 5px rgba(46, 125, 50, 0.3);

}

</style>

</head>

<body>

<div class="container mt-5">

<h2 class="text-center">Login to ExpenseTracker</h2>

<form action="authenticateuser" method="post">

<!-- Email -->

<div class="mb-3">

<label for="email" class="form-label">Email Address</label>

<input type="email" class="form-control" id="email" name="email" required>

</div>


<!-- Password -->

<div class="mb-3">

<label for="password" class="form-label">Password</label>

<input type="password" class="form-control" id="password" name="password" required>

</div>


<!-- Submit Button -->

<div class="text-center">

<button type="submit" class="btn btn-primary">Login</button>

</div>

</form>

</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js" integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq" crossorigin="anonymous"></script>

</body>

</html>

