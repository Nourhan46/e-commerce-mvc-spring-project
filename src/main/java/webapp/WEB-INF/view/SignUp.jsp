<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Account | Modern Store</title>
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
            --ring: rgba(99, 102, 241, 0.15);
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Plus Jakarta Sans', sans-serif;
            background-color: var(--bg);
            /* خلفية متدرجة زي صفحة اللوجين */
            background-image: radial-gradient(circle at top left, #e0e7ff, transparent),
                              radial-gradient(circle at bottom right, #f1f5f9, transparent);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
            color: var(--text-main);
        }

        .signup-card {
            background-color: var(--card-bg);
            border-radius: 24px;
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.05),
                        0 8px 10px -6px rgba(0, 0, 0, 0.05);
            width: 100%;
            max-width: 480px;
            padding: 40px;
            border: 1px solid var(--border);
        }

        .header {
            text-align: center;
            margin-bottom: 30px;
        }

        .header h2 {
            font-size: 1.75rem;
            font-weight: 800;
            letter-spacing: -0.5px;
            margin-bottom: 8px;
        }

        .header p {
            color: var(--text-muted);
            font-size: 0.95rem;
        }

        /* Form Layout */
        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
        }

        .form-group {
            margin-bottom: 18px;
        }

        .full-width {
            grid-column: span 2;
        }

        label {
            display: block;
            font-size: 0.85rem;
            font-weight: 700;
            margin-bottom: 6px;
            margin-left: 4px;
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

        input {
            width: 100%;
            padding: 12px 15px 12px 42px;
            border: 1.5px solid var(--border);
            border-radius: 12px;
            font-size: 0.95rem;
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

        /* Submit Button */
        .btn-signup {
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

        .btn-signup:hover {
            background-color: var(--primary-hover);
            transform: translateY(-1px);
            box-shadow: 0 10px 15px -3px rgba(99, 102, 241, 0.3);
        }

        /* Footer */
        .footer {
            margin-top: 25px;
            text-align: center;
            padding-top: 20px;
            border-top: 1px solid var(--border);
        }

        .footer p {
            font-size: 0.9rem;
            color: var(--text-muted);
        }

        .footer a {
            color: var(--primary);
            text-decoration: none;
            font-weight: 700;
        }

        .footer a:hover {
            text-decoration: underline;
        }

        /* Responsive */
        @media (max-width: 480px) {
            .form-grid { grid-template-columns: 1fr; }
            .full-width { grid-column: span 1; }
            .signup-card { padding: 25px; }
        }
    </style>
</head>
<body>

  <div class="signup-card">
    <div class="header">
        <h2>Create Account</h2>
        <p>Join our community today</p>
    </div>

    <form action="signup" method="post" modelAttribute="user">

      <div class="form-grid">
          <div class="form-group full-width">
            <label for="name">Full Name</label>
            <div class="input-wrapper">
                <i data-lucide="user"></i>
                <input type="text" placeholder="John Doe" name="name" id="name" required>
            </div>
          </div>

          <div class="form-group full-width">
            <label for="username">Username</label>
            <div class="input-wrapper">
                <i data-lucide="at-sign"></i>
                <input type="text" placeholder="johndoe123" name="username" id="username" required>
            </div>
          </div>

          <div class="form-group full-width">
            <label for="email">Email Address</label>
            <div class="input-wrapper">
                <i data-lucide="mail"></i>
                <input type="email" placeholder="john@example.com" name="email" id="email" required>
            </div>
          </div>

          <div class="form-group full-width">
            <label for="password">Password</label>
            <div class="input-wrapper">
                <i data-lucide="lock"></i>
                <input type="password" placeholder="••••••••" name="password" id="id" required>
            </div>
          </div>
      </div>

      <button type="submit" class="btn-signup">
          Create Account <i data-lucide="user-plus" style="width: 18px;"></i>
      </button>

      <div class="footer">
        <p>Already have an account? <a href="login">Login here</a></p>
      </div>

    </form>
  </div>

  <script>
    // Initialize Lucide Icons
    lucide.createIcons();
  </script>

</body>
</html>