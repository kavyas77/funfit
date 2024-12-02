package com.gym.dao;

import com.gym.model.Batch;
import com.gym.model.Participant;
import com.gym.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ParticipantDAO {
	public void addParticipant(Participant participant) {
        String query = "INSERT INTO participants (name, email, batch_id) VALUES (?, ?, ?)";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, participant.getName());
            stmt.setString(2, participant.getEmail());
            stmt.setInt(3, participant.getBatchId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Participant> getAllParticipants() {
        List<Participant> participants = new ArrayList<>();
        String query = "SELECT * FROM participants";
        try (Connection conn = DBUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                Participant participant = new Participant();
                participant.setParticipantId(rs.getInt("participant_id"));
                participant.setName(rs.getString("name"));
                participant.setEmail(rs.getString("email"));
                participant.setBatchId(rs.getInt("batch_id"));
                
                
                BatchDAO batchDAO = new BatchDAO();
                Batch batch = batchDAO.getBatchById(participant.getBatchId());  // Get batch details by batchId
                participant.setBatch(batch); 
                
                
                participants.add(participant);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return participants;
    }
    
    public void updateParticipant(Participant participant) {
        String query = "UPDATE participants SET name = ?, email = ?, batch_id = ? WHERE participant_id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, participant.getName());
            stmt.setString(2, participant.getEmail());  // Update email if needed
            stmt.setInt(3, participant.getBatchId());
            stmt.setInt(4, participant.getParticipantId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    
    public void deleteParticipant(int participantId) {
        String query = "DELETE FROM participants WHERE participant_id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, participantId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
	

}
