package com.example.useraccess.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.example.DBUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class SoftwareServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String name = req.getParameter("name");
        String description = req.getParameter("description");
        String[] levels = req.getParameterValues("access_levels");
        String accessLevels = String.join(",", levels);

        try (Connection conn = DBUtil.getConnection()) {
            String query = "INSERT INTO software (name, description, access_levels) VALUES (?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, description);
            ps.setString(3, accessLevels);
            ps.executeUpdate();
            res.sendRedirect("createSoftware.jsp");
        }
         catch (Exception e) 
         {
            throw new ServletException("Error creating software", e);
        }
    }
}
