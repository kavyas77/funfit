<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Batch</title>
</head>
<body>
<h1>Edit Batch</h1>
    <form action="<%= request.getContextPath() + "/batchServlet" %>" method="POST">
        <input type="hidden" name="batchId" value="${batch.id}">
        <label for="batchName">Batch Name: </label>
        <input type="text" id="batchName" name="batchName" value="${batch.batchName}" required><br><br>
        <label for="time">Batch Time: </label>
        <input type="text" id="time" name="time" value="${batch.time}" required><br><br>
        <input type="submit" value="Update Batch">
    </form>
    <a href="batchList.jsp">Back to Batch List</a>


</body>
</html>