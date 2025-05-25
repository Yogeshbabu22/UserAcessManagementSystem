package com.example.useraccess.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.example.DBUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class RequestServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        // Get userId from session safely
        Object userIdObj = req.getSession().getAttribute("userId");
        if (userIdObj == null) {
            throw new ServletException("User not logged in or session expired");
        }
        int userId;
        try {
            userId = (Integer) userIdObj; // Make sure you store Integer in session
        } catch (ClassCastException e) {
            throw new ServletException("Invalid userId in session", e);
        }

        // Get and validate software_id parameter
        String softwareIdStr = req.getParameter("software_id");
        if (softwareIdStr == null || softwareIdStr.isEmpty()) {
            throw new ServletException("software_id parameter missing or empty");
        }

        int softwareId;
        try {
            softwareId = Integer.parseInt(softwareIdStr);
        } catch (NumberFormatException e) {
            throw new ServletException("Invalid software_id parameter", e);
        }

        String accessType = req.getParameter("access_type");
        String reason = req.getParameter("reason");

        if (accessType == null || accessType.isEmpty()) {
            throw new ServletException("access_type parameter missing or empty");
        }
        if (reason == null || reason.isEmpty()) {
            throw new ServletException("reason parameter missing or empty");
        }

        try (Connection conn = DBUtil.getConnection()) {
            String query = "INSERT INTO requests (user_id, software_id, access_type, reason, status) VALUES (?, ?, ?, ?, 'Pending')";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, userId);
            ps.setInt(2, softwareId);
            ps.setString(3, accessType);
            ps.setString(4, reason);
            ps.executeUpdate();

            // Redirect to a confirmation or the same page after submission
            res.sendRedirect("requestAccess.jsp");
        } catch (Exception e) {
            throw new ServletException("Request failed", e);
        }
    }
}
