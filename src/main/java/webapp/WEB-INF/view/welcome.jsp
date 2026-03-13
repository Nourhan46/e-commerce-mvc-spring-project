<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Welcome to Our App</title>
<style>
  /* إعدادات الصفحة الأساسية بنفس ستايل الصفحات السابقة */
  body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: #e9ecef;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
    padding: 20px;
    box-sizing: border-box;
  }

  /* كارت الترحيب */
  .welcome-card {
    background-color: #ffffff;
    border-radius: 12px;
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
    width: 100%;
    max-width: 450px;
    padding: 40px 30px;
    text-align: center;
  }

  /* تصميم النصوص */
  .welcome-card h1 {
    color: #343a40;
    margin-top: 0;
    margin-bottom: 15px;
    font-size: 2rem;
  }

  .welcome-card p {
    color: #6c757d;
    font-size: 1.1rem;
    margin-bottom: 35px;
    line-height: 1.5;
  }

  /* حاوية الأزرار لترتيبهم جنب بعض أو فوق بعض حسب الشاشة */
  .button-group {
    display: flex;
    gap: 15px;
    justify-content: center;
    flex-wrap: wrap;
  }

  /* التصميم الأساسي للأزرار (روابط على شكل أزرار) */
  .btn {
    text-decoration: none;
    padding: 14px 24px;
    border-radius: 5px;
    font-size: 1rem;
    font-weight: bold;
    color: white;
    width: 100%;
    max-width: 180px;
    transition: background-color 0.3s ease, transform 0.2s ease;
    box-sizing: border-box;
  }

  /* تأثير عند التمرير على الزر */
  .btn:active {
    transform: scale(0.98);
  }

  /* زر تسجيل الدخول (أزرق زي صفحة الـ Login) */
  .btn-login {
    background-color: #339af0;
  }

  .btn-login:hover {
    background-color: #228be6;
  }

  /* زر إنشاء حساب (أخضر زي صفحة الـ Sign Up) */
  .btn-signup {
    background-color: #28a745;
  }

  .btn-signup:hover {
    background-color: #218838;
  }

</style>
</head>
<body>

  <div class="welcome-card">
    <h1>Welcome </h1>

    <div class="button-group">
      <a href="login" class="btn btn-login">Login</a>
      <a href="SignUp" class="btn btn-signup">Sign Up</a>
    </div>
  </div>

</body>
</html>