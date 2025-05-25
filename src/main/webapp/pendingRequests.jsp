<%@ page language="java" import="java.sql.*,com.example.DBUtil" %>
<%
    String role = (String) session.getAttribute("role");
    if (role == null || !role.equals("Manager")) {
        response.sendRedirect("login.jsp");
        return;
    }

    Connection conn = DBUtil.getConnection();
    String query = "SELECT r.id, u.username, s.name AS software_name, r.access_type, r.reason " +
                   "FROM requests r JOIN users u ON r.user_id = u.id " +
                   "JOIN software s ON r.software_id = s.id WHERE r.status = 'Pending'";
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery(query);
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Pending Requests</title>
<style>
  body {
    font-family: Arial, sans-serif;
    background: #f9f9f9;
    margin: 20px;
    color: #333;
  }
  h2 {
    text-align: center;
    margin-bottom: 25px;
    color: #2c3e50;
  }
  table {
    width: 100%;
    border-collapse: collapse;
    margin: 0 auto;
    max-width: 900px;
    background: white;
    box-shadow: 0 4px 12px rgb(0 0 0 / 0.1);
  }
  th, td {
    padding: 12px 15px;
    border: 1px solid #ddd;
    text-align: left;
  }
  th {
    background-color: #2980b9;
    color: white;
    font-weight: 600;
  }
  tr:nth-child(even) {
    background-color: #f2f7fb;
  }
  form {
    margin: 0;
  }
  input[type="submit"] {
    background-color: #2980b9;
    border: none;
    color: white;
    padding: 6px 12px;
    margin-right: 6px;
    border-radius: 4px;
    cursor: pointer;
    font-size: 0.9rem;
    transition: background-color 0.3s ease;
  }
  input[type="submit"]:hover {
    background-color: #1f6391;
  }

  /* Responsive Table */
  @media (max-width: 700px) {
    table, thead, tbody, th, td, tr {
      display: block;
    }
    thead tr {
      position: absolute;
      top: -9999px;
      left: -9999px;
    }
    tr {
      margin-bottom: 20px;
      background: white;
      box-shadow: 0 4px 12px rgb(0 0 0 / 0.1);
      padding: 15px;
      border-radius: 8px;
    }
    td {
      border: none;
      position: relative;
      padding-left: 50%;
      text-align: left;
    }
    td::before {
      position: absolute;
      left: 15px;
      top: 12px;
      width: 45%;
      white-space: nowrap;
      font-weight: 600;
      color: #555;
    }
    td:nth-of-type(1)::before { content: "Employee"; }
    td:nth-of-type(2)::before { content: "Software"; }
    td:nth-of-type(3)::before { content: "Access Type"; }
    td:nth-of-type(4)::before { content: "Reason"; }
    td:nth-of-type(5)::before { content: "Action"; }
  }
</style>
</head>
<body>
<h2>Pending Access Requests</h2>
<table>
    <thead>
    <tr>
        <th>Employee</th>
        <th>Software</th>
        <th>Access Type</th>
        <th>Reason</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <% while (rs.next()) { %>
    <tr>
        <td><%= rs.getString("username") %></td>
        <td><%= rs.getString("software_name") %></td>
        <td><%= rs.getString("access_type") %></td>
        <td><%= rs.getString("reason") %></td>
        <td>
            <form action="ApprovalServlet" method="post" style="display:inline;">
                <input type="hidden" name="request_id" value="<%= rs.getInt("id") %>">
                <input type="submit" name="action" value="Approve">
                <input type="submit" name="action" value="Reject">
            </form>
        </td>
    </tr>
    <% } %>
    </tbody>
</table>
</body>
</html>
<%
    rs.close();
    stmt.close();
    conn.close();
%>
