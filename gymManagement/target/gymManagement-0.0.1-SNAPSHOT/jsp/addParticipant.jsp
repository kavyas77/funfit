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

<form action="<%= request.getContextPath() + "/addParticipant" %>" method="POST">
    <label for="name">Participant Name: </label>
    <input type="text" id="name" name="name" required><br><br>

    <label for="batch">Batch: </label>
    <select id="batch" name="batchId" required>
        <option value="">Select a Batch</option>
        <!-- Dynamically populate batches here -->
        <%
            List<Batch> batches = (List<Batch>) request.getAttribute("batches");
            if (batches != null && !batches.isEmpty()) {
                for (Batch batch : batches) {
        %>
            <option value="<%= batch.getBatchId() %>">
                <%= batch.getBatchName() %> (Schedule: <%= batch.getTime() %>)
            </option>
        <%
                }
            } else {
        %>
            <option value="">No batches available</option>
        <%
            }
        %>
    </select><br><br>

    <input type="submit" value="Add Participant">
</form>

<br>
<a href="welcome.jsp">Back to Home</a>

</body>
</html>
