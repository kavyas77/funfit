package com.gym.servlet;
import com.gym.dao.ParticipantDAO;
import com.gym.model.Batch;
import com.gym.dao.BatchDAO;
import com.gym.model.Participant;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


public class ParticipantServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 String participantIdStr = request.getParameter("participantId");
	        if (participantIdStr != null) {
	            int participantId = Integer.parseInt(participantIdStr);
	            ParticipantDAO participantDAO = new ParticipantDAO();
	            participantDAO.deleteParticipant(participantId);  // Delete participant from DB
	            response.sendRedirect(request.getContextPath() + "/participant");  // Redirect to the participant list page
	            return; // Stop further processing if it's a delete request
	        }
		
		
		
		
		
		
		
		
		
		BatchDAO batchDAO = new BatchDAO();
        List<Batch> batches = batchDAO.getAllBatches();
        
        if (batches.isEmpty()) {
        	System.out.println("No batches available in the database.");
        }
        
        
        request.setAttribute("batches", batches);
        
        ParticipantDAO participantDAO = new ParticipantDAO();
        List<Participant> participants = participantDAO.getAllParticipants();
        
        request.setAttribute("participants", participants);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/participantList.jsp");
        dispatcher.forward(request, response);
       
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String batchIdStr = request.getParameter("batchId");
        String participantIdStr = request.getParameter("participantId");
       
		if (batchIdStr == null || batchIdStr.isEmpty()) {
            
            request.setAttribute("errorMessage", "Please select a batch.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/addParticipant.jsp");
            dispatcher.forward(request, response);
            return;
        }

        
        int batchId = -1; 
        
        try {
            batchId = Integer.parseInt(batchIdStr);
           
        } catch (NumberFormatException e) {
            
            request.setAttribute("errorMessage", "Invalid batch selection.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/addParticipant.jsp");
            dispatcher.forward(request, response);
            return;
        }

        Participant participant = new Participant();
        participant.setName(name);
        participant.setEmail(email);
        participant.setBatchId(batchId);

        ParticipantDAO participantDAO = new ParticipantDAO();
        if (participantIdStr != null && !participantIdStr.isEmpty()) {
            // Update participant
            int participantId = Integer.parseInt(participantIdStr);
            participant.setParticipantId(participantId);
            participantDAO.updateParticipant(participant);  // Update operation
        } else {
            // Add new participant
            participantDAO.addParticipant(participant);  // Add operation
        }
        
        participantDAO.addParticipant(participant);
        response.sendRedirect(request.getContextPath() + "/participant");
    }

}

