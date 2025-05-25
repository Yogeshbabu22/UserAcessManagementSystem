<%@ page language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Sign Up</title>
<style>
  body {
    font-family: Arial, sans-serif;
    background: #f4f7f8;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
  }
  .signup-container {
    background: white;
    padding: 30px 40px;
    border-radius: 8px;
    box-shadow: 0 6px 18px rgb(0 0 0 / 0.1);
    width: 90%;
    max-width: 400px;
  }
  h2 {
    text-align: center;
    margin-bottom: 25px;
    color: #2c3e50;
  }
  form {
    display: flex;
    flex-direction: column;
  }
  label {
    margin-bottom: 6px;
    font-weight: 600;
    color: #34495e;
  }
  input[type="text"],
  input[type="password"] {
    padding: 10px;
    margin-bottom: 20px;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 1rem;
    transition: border-color 0.3s ease;
  }
  input[type="text"]:focus,
  input[type="password"]:focus {
    border-color: #2980b9;
    outline: none;
  }
  input[type="submit"] {
    background-color: #2980b9;
    border: none;
    color: white;
    padding: 12px;
    border-radius: 4px;
    cursor: pointer;
    font-size: 1rem;
    transition: background-color 0.3s ease;
  }
  input[type="submit"]:hover {
    background-color: #1f6391;
  }
  .login-link {
    display: block;
    margin-top: 15px;
    text-align: center;
    color: #2980b9;
    text-decoration: none;
    font-size: 0.9rem;
  }
  .login-link:hover {
    text-decoration: underline;
  }

  /* Responsive tweaks for smaller screens */
  @media (max-width: 480px) {
    .signup-container {
      padding: 25px 20px;
    }
    input[type="submit"] {
      font-size: 0.9rem;
      padding: 10px;
    }
  }
</style>
</head>
<body>
  <div class="signup-container">
    <h2>Sign Up</h2>
    <form action="SignUpServlet" method="post" novalidate>
      <label for="username">Username:</label>
      <input type="text" id="username" name="username" required autocomplete="username" />

      <label for="password">Password:</label>
      <input type="password" id="password" name="password" required autocomplete="new-password" />

      <input type="submit" value="Sign Up" />
    </form>
    <a class="login-link" href="login.jsp">Already have an account? Login</a>
  </div>
</body>
</html>
