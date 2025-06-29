<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, com.entity.ExpenseEntity" %>
<html>
<head><title>Expenses</title></head>
<body>
    <h2>Your Expenses</h2>
    <table border="1" cellpadding="8">
        <tr>
            <th>Title</th>
            <th>Category</th>
            <th>Amount</th>
            <th>Date</th>
        </tr>
        <%
            List<ExpenseEntity> expenses = (List<ExpenseEntity>) request.getAttribute("expenses");
            if (expenses != null) {
                for (ExpenseEntity e : expenses) {
        %>
        <tr>
            <td><%= e.getTitle() %></td>
            <td><%= e.getCategory() %></td>
            <td>₹<%= e.getAmount() %></td>
            <td><%= e.getDate() %></td>
        </tr>
        <%
                }
            }
        %>
    </table>
</body>
</html>
