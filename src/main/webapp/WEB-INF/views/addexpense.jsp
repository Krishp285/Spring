<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Add Expense</title>
</head>
<body>
    <h2>Add New Expense</h2>
    <form action="saveexpense" method="post">
        <label>Title:</label>
        <input type="text" name="title" required /><br><br>

        <label>Category:</label>
        <select name="category">
            <option>Food</option>
            <option>Transport</option>
            <option>Shopping</option>
            <option>Other</option>
        </select><br><br>

        <label>Amount:</label>
        <input type="number" step="0.01" name="amount" required /><br><br>

        <label>Date:</label>
        <input type="date" name="expensedate" required /><br><br>

        <button type="submit">Add Expense</button>
    </form>
</body>
</html>
