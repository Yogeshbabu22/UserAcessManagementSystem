package com.example.useraccess.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.example.DBUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ApprovalServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        int requestId = Integer.parseInt(req.getParameter("request_id"));
        String action = req.getParameter("action"); // "Approve" or "Reject"

        try (Connection conn = DBUtil.getConnection()) {
            String query = "UPDATE requests SET status=? WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, action);
            ps.setInt(2, requestId);
            ps.executeUpdate();
            res.sendRedirect("pendingRequests.jsp");
        } catch (Exception e) {
            throw new ServletException("Approval failed", e);
        }
    }
}
