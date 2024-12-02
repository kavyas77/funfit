<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
    <%@ page import="com.gym.model.Participant" %>
    <%@ page import="com.gym.model.Batch" %>
    <!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Participant List</title>
</head>
<body>
    <h1>Participant List</h1>

    <!-- Display the list of participants -->
    <h2>Existing Participants</h2>
    <table border="1">
        <thead>
            <tr>
                <th>Name</th>
                <th>Batch Name</th>
                <th>Batch Time</th>
            </tr>
        </thead>
        <tbody>
            <% 
                List<Participant> participants = (List<Participant>) request.getAttribute("participants");
                if (participants != null && !participants.isEmpty()) {
                    for (Participant participant : participants) {
            %>
                        <tr>
                            <td><%= participant.getName() %></td>
                            <td><%= participant.getBatch().getBatchName() %></td>
                            <td><%= participant.getBatch().getTime() %></td>
                        </tr>
            <%      }
                } else { 
            %>
                        <tr><td colspan="3">No participants available</td></tr>
            <%      }
            %>
        </tbody>
    </table>

    <br>
    <a href="welcome.jsp">Back to Home</a>

</body>
</html>