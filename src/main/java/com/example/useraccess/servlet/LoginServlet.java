package com.example.useraccess.servlet;

import com.example.DBUtil;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        try (Connection conn = DBUtil.getConnection()) {
            String query = "SELECT * FROM users WHERE username=? AND password=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String role = rs.getString("role");
                HttpSession session = req.getSession();
                session.setAttribute("userId", rs.getInt("id"));
                session.setAttribute("username", username);
                session.setAttribute("role", role);

                switch (role) {
                    case "Employee":
                        res.sendRedirect("requestAccess.jsp");
                        break;
                    case "Manager":
                        res.sendRedirect("pendingRequests.jsp");
                        break;
                    case "Admin":
                        res.sendRedirect("createSoftware.jsp");
                        break;
                }
            } else {
                res.getWriter().println("Invalid credentials");
            }
        } catch (Exception e) {
            throw new ServletException("Login failed", e);
        }
    }
}
