<%@ page language="java" import="java.sql.*,com.example.DBUtil" %>
<%
    String role = (String) session.getAttribute("role");
    if (role == null || !role.equals("Employee")) {
        response.sendRedirect("login.jsp");
        return;
    }

    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    try {
        conn = DBUtil.getConnection();
        stmt = conn.createStatement();
        rs = stmt.executeQuery("SELECT id, name FROM software");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Request Access</title>
<style>
  /* Basic reset */
  * {
    box-sizing: border-box;
  }
  body {
    font-family: Arial, sans-serif;
    margin: 20px;
    background: #f4f6f8;
    color: #333;
  }
  h2 {
    text-align: center;
    margin-bottom: 30px;
    color: #2c3e50;
  }
  form {
    max-width: 480px;
    background: white;
    margin: 0 auto;
    padding: 25px;
    border-radius: 8px;
    box-shadow: 0 4px 12px rgb(0 0 0 / 0.1);
  }
  label {
    display: block;
    margin-top: 15px;
    font-weight: 600;
  }
  select, textarea, input[type="submit"] {
    width: 100%;
    padding: 10px 12px;
    margin-top: 6px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 1rem;
    font-family: inherit;
  }
  textarea {
    resize: vertical;
    min-height: 80px;
  }
  input[type="submit"] {
    margin-top: 25px;
    background-color: #2980b9;
    color: white;
    border: none;
    cursor: pointer;
    font-weight: 700;
    transition: background-color 0.3s ease;
  }
  input[type="submit"]:hover {
    background-color: #1f6391;
  }

  /* Responsive adjustments */
  @media (max-width: 520px) {
    body {
      margin: 10px;
    }
    form {
      padding: 20px 15px;
      max-width: 100%;
    }
  }
</style>
</head>
<body>
<h2>Request Access</h2>
<form action="RequestServlet" method="post">
    <label for="software_id">Software:</label>
    <select name="software_id" id="software_id" required>
        <% while (rs.next()) { %>
            <option value="<%= rs.getInt("id") %>"><%= rs.getString("name") %></option>
        <% } %>
    </select>

    <label for="access_type">Access Type:</label>
    <select name="access_type" id="access_type" required>
        <option value="Read">Read</option>
        <option value="Write">Write</option>
        <option value="Admin">Admin</option>
    </select>

    <label for="reason">Reason:</label>
    <textarea name="reason" id="reason" required></textarea>

    <input type="submit" value="Submit Request" />
</form>
</body>
</html>
<%
    } finally {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }
%>
