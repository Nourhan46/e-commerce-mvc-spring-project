<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modern Login | Secure Access</title>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <script src="https://unpkg.com/lucide@latest"></script>

    <style>
        :root {
            --primary: #6366f1;
            --primary-hover: #4f46e5;
            --bg: #f8fafc;
            --card-bg: #ffffff;
            --text-main: #1e293b;
            --text-muted: #64748b;
            --border: #e2e8f0;
            --ring: rgba(99, 102, 241, 0.2);
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Plus Jakarta Sans', sans-serif;
            background-color: var(--bg);
            /* خلفية متدرجة بسيطة تعطي عمق */
            background-image: radial-gradient(circle at top right, #e2e8f0, transparent),
                              radial-gradient(circle at bottom left, #e0e7ff, transparent);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            color: var(--text-main);
        }

        .login-card {
            background-color: var(--card-bg);
            border-radius: 24px;
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.05),
                        0 10px 10px -5px rgba(0, 0, 0, 0.02);
            width: 100%;
            max-width: 420px;
            padding: 40px;
            border: 1px solid var(--border);
            transition: transform 0.3s ease;
        }

        .header {
            text-align: center;
            margin-bottom: 32px;
        }

        .header h2 {
            font-size: 1.8rem;
            font-weight: 800;
            letter-spacing: -0.5px;
            margin-bottom: 8px;
        }

        .header p {
            color: var(--text-muted);
            font-size: 0.95rem;
        }

        /* Styling Input Groups */
        .form-group {
            margin-bottom: 20px;
            position: relative;
        }

        label {
            display: block;
            font-size: 0.85rem;
            font-weight: 700;
            margin-bottom: 8px;
            color: var(--text-main);
        }

        .input-wrapper {
            position: relative;
            display: flex;
            align-items: center;
        }

        .input-wrapper i {
            position: absolute;
            left: 14px;
            color: var(--text-muted);
            width: 18px;
            height: 18px;
        }

        input[type=text], input[type=password] {
            width: 100%;
            padding: 12px 15px 12px 42px; /* مسافة للأيقونة */
            border: 1.5px solid var(--border);
            border-radius: 12px;
            font-size: 1rem;
            font-family: inherit;
            transition: all 0.2s ease;
            background-color: #fcfcfd;
        }

        input:focus {
            outline: none;
            border-color: var(--primary);
            background-color: white;
            box-shadow: 0 0 0 4px var(--ring);
        }

        /* Main Login Button */
        .btn-login {
            background-color: var(--primary);
            color: white;
            padding: 14px;
            border: none;
            border-radius: 12px;
            cursor: pointer;
            width: 100%;
            font-size: 1rem;
            font-weight: 700;
            transition: all 0.3s ease;
            margin-top: 10px;
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 8px;
        }

        .btn-login:hover {
            background-color: var(--primary-hover);
            transform: translateY(-1px);
            box-shadow: 0 10px 15px -3px rgba(99, 102, 241, 0.3);
        }

        .btn-login:active {
            transform: translateY(0);
        }

        /* Footer Links */
        .footer {
            margin-top: 25px;
            text-align: center;
            font-size: 0.9rem;
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .footer a {
            color: var(--primary);
            text-decoration: none;
            font-weight: 600;
            transition: color 0.2s;
        }

        .footer a:hover {
            color: var(--primary-hover);
            text-decoration: underline;
        }

        .divider {
            display: flex;
            align-items: center;
            text-align: center;
            color: var(--text-muted);
            font-size: 0.8rem;
            margin: 20px 0;
        }

        .divider::before, .divider::after {
            content: '';
            flex: 1;
            border-bottom: 1px solid var(--border);
        }

        .divider:not(:empty)::before { margin-right: .5em; }
        .divider:not(:empty)::after { margin-left: .5em; }

        .btn-cancel {
            background: none;
            border: 1px solid var(--border);
            color: var(--text-muted);
            padding: 10px;
            border-radius: 10px;
            cursor: pointer;
            font-weight: 600;
            font-size: 0.85rem;
            transition: all 0.2s;
        }

        .btn-cancel:hover {
            background-color: #fff1f2;
            color: #e11d48;
            border-color: #fecdd3;
        }
    </style>
</head>
<body>

  <div class="login-card">
    <div class="header">
        <h2>Welcome Back</h2>
        <p>Please enter your details to sign in</p>
    </div>

    <form action="login" method="post" modelAttribute="user">

      <div class="form-group">
        <label for="email">Email Address</label>
        <div class="input-wrapper">
            <i data-lucide="mail"></i>
            <input type="text" placeholder="name@company.com" name="email" id="email" required>
        </div>
      </div>

      <div class="form-group">
        <div style="display: flex; justify-content: space-between; align-items: center;">
            <label for="password">Password</label>
            <a href="#" style="font-size: 0.8rem; color: var(--primary); text-decoration: none; font-weight: 600; margin-bottom: 8px;">Forgot?</a>
        </div>
        <div class="input-wrapper">
            <i data-lucide="lock"></i>
            <input type="password" placeholder="••••••••" name="password" id="password" required>
        </div>
      </div>

      <button type="submit" class="btn-login">
          Sign in <i data-lucide="arrow-right" style="width: 18px;"></i>
      </button>

      <div class="footer">
        <div class="divider">OR</div>
        <button type="button" class="btn-cancel">Cancel and Return</button>
        <p style="color: var(--text-muted);">Don't have an account? <a href="#">Create one</a></p>
      </div>

    </form>
  </div>

  <script>
    // Initialize icons
    lucide.createIcons();
  </script>

</body>
</html>