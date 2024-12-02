<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List" %>
<%@ page import="com.gym.model.Batch" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Batch List</title>
</head>
<body>
    <h1>Batch List</h1>

    
    <form action="<%= request.getContextPath() + "/batchServlet" %>" method="POST">
        <label for="batchName">Batch Name: </label>
        <input type="text" id="batchName" name="batchName" required><br><br>
        
        <label for="time">Batch Time: </label>
        <input type="text" id="time" name="time" required><br><br>

        <input type="submit" value="Add Batch">
    </form>

    <!-- Display the list of batches -->
    <h2>Existing Batches</h2>
    <table border="1">
        <thead>
            <tr>
                <th>Batch ID</th>
                <th>Batch Name</th>
                <th>Time</th>
            </tr>
        </thead>
        <tbody>
            <% 
                List<Batch> batches = (List<Batch>) request.getAttribute("batches");
                if (batches != null && !batches.isEmpty()) {
                    for (Batch batch : batches) {
            %>
                        <tr>
                            <td><%= batch.getBatchId() %></td>
                            <td><%= batch.getBatchName() %></td>
                            <td><%= batch.getTime() %></td>
                        </tr>
            <%      }
                } else { 
            %>
                        <tr><td colspan="3">No batches available</td></tr>
            <%      }
            %>
        </tbody>
    </table>

</body>
</html>