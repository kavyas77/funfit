package com.gym.servlet;
import com.gym.dao.BatchDAO;

import com.gym.model.Batch;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


public class BatchServlet extends HttpServlet {
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        BatchDAO batchDAO = new BatchDAO();
	        request.setAttribute("batches", batchDAO.getAllBatches());
	        request.getRequestDispatcher("/jsp/batchList.jsp").forward(request, response);
	    }

	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String batchName = request.getParameter("batchName");
	        String time = request.getParameter("time");

	        Batch batch = new Batch();
	        batch.setBatchName(batchName);
	        batch.setTime(time);

	        BatchDAO batchDAO = new BatchDAO();
	        batchDAO.addBatch(batch);
	        response.sendRedirect(request.getContextPath() + "/batchServlet");
	    }
	

}