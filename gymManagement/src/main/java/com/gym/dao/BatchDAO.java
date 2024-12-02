package com.gym.dao;
import com.gym.model.Batch;
import com.gym.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class BatchDAO {
	private static final Logger logger = Logger.getLogger(BatchDAO.class.getName());
	public void addBatch(Batch batch) {
        String query = "INSERT INTO batches (batch_name, time) VALUES (?, ?)";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, batch.getBatchName());
            stmt.setString(2, batch.getTime());
            int rowsAffected = stmt.executeUpdate();
            System.out.println("Rows affected: " + rowsAffected);
            
        } catch (SQLException e) {
        	logger.log(Level.SEVERE, "Error inserting batch: " + batch.getBatchName(), e);
        }
    }

    public List<Batch> getAllBatches() {
        List<Batch> batches = new ArrayList<>();
        String query = "SELECT * FROM batches";
        try (Connection conn = DBUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                Batch batch = new Batch();
                batch.setBatchId(rs.getInt("batch_id"));
                batch.setBatchName(rs.getString("batch_name"));
                batch.setTime(rs.getString("time"));
                batches.add(batch);
            }
            if (batches.isEmpty()) {
                logger.log(Level.INFO, "No batches found in the database.");
            }
            
        } catch (SQLException e) {
        	logger.log(Level.SEVERE, "Error fetching batches", e);
        }
        return batches;
    }
    
    public Batch getBatchById(int batchId) {
        Batch batch = null;
        String query = "SELECT * FROM batches WHERE batch_id = ?";
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, batchId);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                batch = new Batch();
                batch.setBatchId(rs.getInt("batch_id"));
                batch.setBatchName(rs.getString("batch_name"));
                batch.setTime(rs.getString("time"));
            } else {
                logger.log(Level.WARNING, "No batch found with batchId: " + batchId);
            }
        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error fetching batch by batchId: " + batchId, e);
        }
        
        return batch;
    }
 
	

}
