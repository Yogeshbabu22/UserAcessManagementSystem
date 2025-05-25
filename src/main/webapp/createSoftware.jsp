<%@ page language="java" import="javax.servlet.http.*,javax.servlet.*" %>
<%
    String role = (String) session.getAttribute("role");
    if (role == null || !role.equals("Admin")) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Create Software</title>
<style>
  body {
    font-family: Arial, sans-serif;
    background: #f9f9f9;
    margin: 20px;
    color: #333;
  }
  h2 {
    text-align: center;
    color: #2c3e50;
    margin-bottom: 30px;
  }
  form {
    max-width: 450px;
    margin: 0 auto;
    background: white;
    padding: 25px 30px;
    border-radius: 8px;
    box-shadow: 0 4px 12px rgb(0 0 0 / 0.1);
  }
  label, input[type="text"], textarea {
    display: block;
    width: 100%;
  }
  input[type="text"], textarea {
    padding: 10px;
    margin-top: 6px;
    margin-bottom: 15px;
    border-radius: 5px;
    border: 1px solid #ccc;
    font-size: 1rem;
    font-family: inherit;
    resize: vertical;
  }
  textarea {
    min-height: 80px;
  }
  .access-levels {
    margin-bottom: 20px;
  }
  .access-levels label {
    display: block;
    margin-bottom: 5px;
    font-weight: 600;
  }
  .checkbox-group {
    margin-bottom: 15px;
  }
  input[type="checkbox"] {
    margin-right: 8px;
  }
  input[type="submit"] {
    width: 100%;
    padding: 12px;
    background-color: #2980b9;
    color: white;
    font-weight: bold;
    font-size: 1.1rem;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
  }
  input[type="submit"]:hover {
    background-color: #1f6391;
  }
  @media (max-width: 500px) {
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
<h2>Create New Software</h2>
<form action="SoftwareServlet" method="post">
    <label for="name">Software Name:</label>
    <input type="text" id="name" name="name" required>

    <label for="description">Description:</label>
    <textarea id="description" name="description" required></textarea>

    <div class="access-levels">
      <label>Access Levels:</label>
      <div class="checkbox-group">
        <input type="checkbox" id="read" name="access_levels" value="Read">
        <label for="read">Read</label>
      </div>
      <div class="checkbox-group">
        <input type="checkbox" id="write" name="access_levels" value="Write">
        <label for="write">Write</label>
      </div>
      <div class="checkbox-group">
        <input type="checkbox" id="admin" name="access_levels" value="Admin">
        <label for="admin">Admin</label>
      </div>
    </div>

    <input type="submit" value="Create">
</form>
</body>
</html>
