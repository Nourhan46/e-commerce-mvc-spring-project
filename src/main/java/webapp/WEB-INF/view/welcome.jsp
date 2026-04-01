<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome | Modern Store</title>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <script src="https://unpkg.com/lucide@latest"></script>

    <style>
        :root {
            --primary: #6366f1;
            --primary-hover: #4f46e5;
            --bg: #f8fafc;
            --card-bg: #ffffff;
            --text-main: #0f172a;
            --text-muted: #64748b;
            --border: #e2e8f0;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Plus Jakarta Sans', sans-serif;
            background-color: var(--bg);
            /* تدرج لوني يعطي طابع الـ Tech/E-commerce */
            background-image:
                radial-gradient(at 0% 0%, hsla(225,39%,30%,0) 0, hsla(225,39%,30%,0.03) 100%),
                radial-gradient(at 100% 100%, hsla(250,100%,70%,0.05) 0, hsla(250,100%,70%,0) 100%);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            overflow: hidden;
        }

        .welcome-card {
            background-color: var(--card-bg);
            border-radius: 32px;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.08);
            width: 100%;
            max-width: 480px;
            padding: 50px 40px;
            text-align: center;
            border: 1px solid var(--border);
            position: relative;
        }

        /* Hero Icon / Logo Area */
        .logo-circle {
            width: 80px;
            height: 80px;
            background: linear-gradient(135deg, var(--primary), #818cf8);
            border-radius: 24px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 30px;
            color: white;
            box-shadow: 0 10px 20px -5px rgba(99, 102, 241, 0.4);
            transform: rotate(-5deg);
        }

        h1 {
            color: var(--text-main);
            font-size: 2.25rem;
            font-weight: 800;
            letter-spacing: -1px;
            margin-bottom: 12px;
        }

        p {
            color: var(--text-muted);
            font-size: 1.05rem;
            line-height: 1.6;
            margin-bottom: 40px;
        }

        .button-group {
            display: flex;
            flex-direction: column; /* ترتيب رأسي في الموبايل */
            gap: 16px;
        }

        .btn {
            text-decoration: none;
            padding: 16px 32px;
            border-radius: 16px;
            font-size: 1rem;
            font-weight: 700;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }

        .btn-login {
            background-color: var(--primary);
            color: white;
            box-shadow: 0 4px 6px -1px rgba(99, 102, 241, 0.2);
        }

        .btn-login:hover {
            background-color: var(--primary-hover);
            transform: translateY(-2px);
            box-shadow: 0 15px 25px -5px rgba(99, 102, 241, 0.3);
        }

        .btn-signup {
            background-color: #f1f5f9;
            color: var(--text-main);
            border: 1px solid var(--border);
        }

        .btn-signup:hover {
            background-color: #e2e8f0;
            border-color: #cbd5e1;
            transform: translateY(-2px);
        }

        /* Decorative Element */
        .trust-badge {
            margin-top: 35px;
            font-size: 0.85rem;
            color: var(--text-muted);
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 6px;
        }

        /* Animation for the card */
        .welcome-card {
            animation: fadeIn 0.8s ease-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @media (min-width: 640px) {
            .button-group {
                flex-direction: row; /* ترتيب أفقي في الشاشات الكبيرة */
            }
            .btn { width: 100%; }
        }
    </style>
</head>
<body>

  <div class="welcome-card">
    <div class="logo-circle">
        <i data-lucide="shopping-bag" style="width: 40px; height: 40px;"></i>
    </div>

    <h1>Welcome Back</h1>
    <p>Experience the future of shopping. Discover premium products curated just for you.</p>

    <div class="button-group">
      <a href="login" class="btn btn-login">
          Sign In <i data-lucide="log-in" style="width: 18px;"></i>
      </a>
      <a href="SignUp" class="btn btn-signup">
          Register <i data-lucide="user-plus" style="width: 18px;"></i>
      </a>
    </div>

    <div class="trust-badge">
        <i data-lucide="shield-check" style="width: 16px; color: #10b981;"></i>
        Trusted by 10k+ active shoppers
    </div>
  </div>

  <script>
    lucide.createIcons();
  </script>

</body>
</html>