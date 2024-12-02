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
    <form action="participantServlet" method="POST">
        <input type="hidden" name="participantId" value="${participant.id}">
        <label for="name">Participant Name: </label>
        <input type="text" id="name" name="name" value="${participant.name}" required><br><br>
        <label for="batch">Batch: </label>
        <input type="text" id="batch" name="batch" value="${participant.batch}" required><br><br>
        <input type="submit" value="Update Participant">
    </form>
    <a href="participantList.jsp">Back to Participant List</a>


</body>
</html>