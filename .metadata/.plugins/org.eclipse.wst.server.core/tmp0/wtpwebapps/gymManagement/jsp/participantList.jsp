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

    <!-- Form to Add a New Participant -->
    <form action="<%= request.getContextPath() + "/participant" %>" method="POST">
        <label for="name">Participant Name: </label>
        <input type="text" id="name" name="name" required><br><br>
        
        <label for="email">Email: </label>
        <input type="email" id="email" name="email" required><br><br>
        
        <!-- Manually Enter the Batch Name and Time -->
        <label for="batchName">Batch Name: </label>
        <input type="text" id="batchName" name="batchName" required><br><br>

        <label for="batchTime">Batch Time: </label>
        <input type="text" id="batchTime" name="batchTime" required><br><br>

        <input type="submit" value="Add Participant">
    </form>

    <br>

    <!-- Display the list of participants -->
    <h2>Existing Participants</h2>
    <table border="1">
        <thead>
            <tr>
                <th>Name</th>
                <th>Email</th>
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
                            <td><%= participant.getEmail() %></td>
                            <td><%= participant.getBatch().getBatchName() %></td>
                            <td><%= participant.getBatch().getTime() %></td>
                        </tr>
            <%      }
                } else { 
            %>
                        <tr><td colspan="4">No participants available</td></tr>
            <%      }
            %>
        </tbody>
    </table>

    <br>
    <a href="<%= request.getContextPath() + "/welcome.jsp" %>">Back to Home</a>

</body>
</html>