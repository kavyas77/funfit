<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.gym.model.Batch" %>
    <%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Participant</title>
</head>
<body>
<h1>Add a New Participant</h1>

<!-- Display error message if it exists -->
<% String errorMessage = (String) request.getAttribute("errorMessage"); %>
<% if (errorMessage != null) { %>
    <div style="color: red;"><%= errorMessage %></div>
<% } %>

<form action="<%= request.getContextPath() + "/participant" %>" method="POST">
    <label for="name">Participant Name: </label>
    <input type="text" id="name" name="name" required><br><br>

    <label for="email">Participant Email: </label>
    <input type="email" id="email" name="email" required><br><br>

    <!-- Input for Batch ID -->
    <label for="batchId">Batch ID: </label>
    <input type="text" id="batchId" name="batchId" required><br><br>

    <input type="submit" value="Add Participant">
</form>

<br>
<a href="welcome.jsp">Back to Home</a>

</body>
</html>
