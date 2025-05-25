<%@ page language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Login</title>
<style>
  /* Reset some default browser styles */
  * {
    box-sizing: border-box;
  }
  body {
    font-family: Arial, sans-serif;
    background: #f0f2f5;
    margin: 0;
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 15px;
  }

  .login-container {
    background: white;
    padding: 30px 40px;
    border-radius: 10px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    width: 100%;
    max-width: 400px;
    text-align: center;
    transition: box-shadow 0.3s ease;
  }
  .login-container:focus-within {
    box-shadow: 0 6px 20px rgba(0, 123, 255, 0.5);
  }

  h2 {
    margin-bottom: 25px;
    color: #333;
    font-size: 1.8rem;
  }

  input[type="text"],
  input[type="password"] {
    width: 100%;
    padding: 14px 12px;
    margin: 10px 0;
    border: 1px solid #ccc;
    border-radius: 6px;
    font-size: 1rem;
    transition: border-color 0.3s ease;
  }

  input[type="text"]:focus,
  input[type="password"]:focus {
    border-color: #007bff;
    outline: none;
  }

  input[type="submit"] {
    width: 100%;
    padding: 14px;
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    font-weight: bold;
    font-size: 1.1rem;
    margin-top: 15px;
    transition: background-color 0.3s ease;
  }

  input[type="submit"]:hover {
    background-color: #0056b3;
  }

  a {
    display: block;
    margin-top: 18px;
    color: #007bff;
    text-decoration: none;
    font-size: 0.9rem;
  }

  a:hover {
    text-decoration: underline;
  }

  /* Responsive tweaks */
  @media (max-width: 480px) {
    .login-container {
      padding: 25px 20px;
      width: 100%;
    }
    h2 {
      font-size: 1.5rem;
    }
    input[type="submit"] {
      font-size: 1rem;
      padding: 12px;
    }
  }
</style>
</head>
<body>
  <div class="login-container">
    <h2>Login</h2>
    <form action="LoginServlet" method="post" novalidate>
      <input type="text" name="username" placeholder="Username" required autocomplete="username" />
      <input type="password" name="password" placeholder="Password" required autocomplete="current-password" />
      <input type="submit" value="Login" />
    </form>
    <a href="signup.jsp">Don't have an account? Sign up</a>
  </div>
</body>
</html>
