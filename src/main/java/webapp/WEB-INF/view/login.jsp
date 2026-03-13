<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Modern Login Form</title>
<style>
  /* Base page styling */
  body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: #e9ecef; /* Soft gray background */
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
  }

  /* Form card styling */
  form {
    background-color: #ffffff;
    border-radius: 10px;
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
    width: 100%;
    max-width: 400px;
    overflow: hidden; /* Keeps the bottom container neat */
  }

  /* Container padding */
  .container {
    padding: 30px;
  }

  /* Typography */
  label {
    color: #495057;
    font-weight: 600;
    font-size: 0.95rem;
  }

  /* Input fields styling */
  input[type=text], input[type=password] {
    width: 100%;
    padding: 12px 15px;
    margin: 8px 0 20px 0;
    display: inline-block;
    border: 1px solid #ced4da;
    border-radius: 5px;
    box-sizing: border-box; /* Ensures padding doesn't affect width */
    font-size: 1rem;
    transition: border-color 0.3s ease;
  }

  /* Input focus effect */
  input[type=text]:focus, input[type=password]:focus {
    border-color: #4dabf7;
    outline: none;
    box-shadow: 0 0 5px rgba(77, 171, 247, 0.3);
  }

  /* Main Login Button */
  button[type=submit] {
    background-color: #339af0;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    width: 100%;
    font-size: 1rem;
    font-weight: bold;
    transition: background-color 0.3s ease;
  }

  button[type=submit]:hover {
    background-color: #228be6;
  }

  /* Bottom Container (Cancel & Forgot Password) */
  .bottom-container {
    background-color: #f8f9fa;
    padding: 20px 30px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-top: 1px solid #e9ecef;
  }

  /* Cancel Button */
  .cancelbtn {
    width: auto;
    padding: 10px 18px;
    background-color: #ff6b6b;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-weight: bold;
    transition: background-color 0.3s ease;
  }

  .cancelbtn:hover {
    background-color: #fa5252;
  }

  /* Forgot Password Link */
  span.psw {
    font-size: 0.9rem;
    color: #495057;
  }

  span.psw a {
    color: #339af0;
    text-decoration: none;
    font-weight: bold;
  }

  span.psw a:hover {
    text-decoration: underline;
  }
</style>
</head>
<body>

  <form action="login" method="post" modelAttribute="user">

    <div class="container">
      <h2 style="text-align: center; color: #343a40; margin-bottom: 25px;">Welcome Back</h2>

      <label for="email">Email</label>
      <input type="text" placeholder="Enter Email" name="email" id="email" required>

      <label for="password">Password</label>
      <input type="password" placeholder="Enter Password" name="password" id="password" required>

      <button type="submit">Login</button>
    </div>

    <div class="bottom-container">
      <button type="button" class="cancelbtn">Cancel</button>
      <span class="psw">Forgot <a href="#">password?</a></span>
    </div>

  </form>

</body>
</html>