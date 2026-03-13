<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Modern Sign Up Form</title>
<style>
  /* إعدادات الصفحة الأساسية */
  body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: #e9ecef;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh; /* min-height بدل height عشان لو الشاشة صغيرة */
    margin: 0;
    padding: 20px;
    box-sizing: border-box;
  }

  /* تصميم كارت الفورم */
  form {
    background-color: #ffffff;
    border-radius: 10px;
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
    width: 100%;
    max-width: 450px; /* عرضتها شوية عشان الحقول أكتر */
    overflow: hidden;
  }

  .container {
    padding: 30px;
  }

  /* تصميم العناوين */
  label {
    color: #495057;
    font-weight: 600;
    font-size: 0.95rem;
    display: block;
    margin-bottom: 5px;
  }

  /* تصميم حقول الإدخال */
  input[type=text], input[type=email], input[type=password] {
    width: 100%;
    padding: 12px 15px;
    margin-bottom: 20px;
    display: inline-block;
    border: 1px solid #ced4da;
    border-radius: 5px;
    box-sizing: border-box;
    font-size: 1rem;
    transition: border-color 0.3s ease, box-shadow 0.3s ease;
  }

  input[type=text]:focus, input[type=email]:focus, input[type=password]:focus {
    border-color: #4dabf7;
    outline: none;
    box-shadow: 0 0 5px rgba(77, 171, 247, 0.3);
  }

  /* زر التسجيل */
  button[type=submit] {
    background-color: #28a745; /* لون أخضر بيعبر عن إضافة جديد/تسجيل */
    color: white;
    padding: 14px 20px;
    margin-top: 10px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    width: 100%;
    font-size: 1rem;
    font-weight: bold;
    transition: background-color 0.3s ease;
  }

  button[type=submit]:hover {
    background-color: #218838;
  }

  /* الجزء السفلي (التحويل لصفحة الدخول) */
  .bottom-container {
    background-color: #f8f9fa;
    padding: 20px 30px;
    text-align: center;
    border-top: 1px solid #e9ecef;
  }

  .bottom-container p {
    margin: 0;
    font-size: 0.95rem;
    color: #495057;
  }

  .bottom-container a {
    color: #339af0;
    text-decoration: none;
    font-weight: bold;
  }

  .bottom-container a:hover {
    text-decoration: underline;
  }
</style>
</head>
<body>

  <form action="signup" method="post" modelAttribute="user">

    <div class="container">
      <h2 style="text-align: center; color: #343a40; margin-bottom: 25px;">Create an Account</h2>

      <label for="name">Full Name</label>
      <input type="text" placeholder="Enter your full name" name="name" id="name" required>

      <label for="username">Username</label>
      <input type="text" placeholder="Choose a username" name="username" id="username" required>

      <label for="email">Email Address</label>
      <input type="email" placeholder="Enter your email" name="email" id="email" required>

      <label for="password">Password</label>
      <input type="password" placeholder="Create a password" name="password" id="password" required>

      <button type="submit">Sign Up</button>
    </div>

    <div class="bottom-container">
      <p>Already have an account? <a href="login">Login here</a></p>
    </div>

  </form>

</body>
</html>