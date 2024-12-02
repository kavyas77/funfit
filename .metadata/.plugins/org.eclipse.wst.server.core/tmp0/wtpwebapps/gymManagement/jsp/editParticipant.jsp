<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Participant</title>
</head>
<body>
<h1>Edit Participant</h1>

<form action="<%= request.getContextPath() + "/participant" %>" method="POST">
    <input type="hidden" name="participantId" value="${participant.participantId}">
    
    <label for="name">Participant Name: </label>
    <input type="text" id="name" name="name" value="${participant.name}" required><br><br>

    <label for="email">Email: </label>
    <input type="email" id="email" name="email" value="${participant.email}" required><br><br>

    <label for="batch">Batch: </label>
    <input type="text" id="batch" name="batch" value="${participant.batch.batchName}" required><br><br>

    <label for="time">Batch Time: </label>
    <input type="text" id="time" name="time" value="${participant.batch.time}" required><br><br>

    <input type="submit" value="Update Participant">
</form>

<!-- Delete Participant Form -->
<form action="<%= request.getContextPath() + "/participant" %>" method="POST">
    <input type="hidden" name="participantId" value="${participant.participantId}">
    <input type="hidden" name="_method" value="DELETE">
    <input type="submit" value="Delete Participant">
</form>

<a href="participantList.jsp">Back to Participant List</a>

</body>
</html>