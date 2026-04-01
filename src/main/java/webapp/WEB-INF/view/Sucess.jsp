<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Success | Thank You For Your Order</title>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <script src="https://unpkg.com/lucide@latest"></script>

    <style>
        :root {
            --primary: #6366f1;
            --success: #10b981;
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
            font-family: 'Plus Jakarta Sans', sans-serif;
        }

        body {
            background-color: var(--bg);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            padding: 20px;
            /* خلفية احتفالية هادئة */
            background-image: radial-gradient(circle at 20% 20%, rgba(16, 185, 129, 0.05) 0%, transparent 40%),
                              radial-gradient(circle at 80% 80%, rgba(99, 102, 241, 0.05) 0%, transparent 40%);
        }

        .success-card {
            background: var(--card-bg);
            padding: 50px 40px;
            border-radius: 32px;
            width: 100%;
            max-width: 500px;
            text-align: center;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.08);
            border: 1px solid var(--border);
            animation: cardAppear 0.6s cubic-bezier(0.34, 1.56, 0.64, 1);
        }

        @keyframes cardAppear {
            0% { transform: scale(0.9); opacity: 0; }
            100% { transform: scale(1); opacity: 1; }
        }

        /* Success Icon Animation */
        .icon-container {
            width: 100px;
            height: 100px;
            background-color: #dcfce7;
            color: var(--success);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 30px;
            position: relative;
            animation: iconPop 0.5s 0.3s both;
        }

        @keyframes iconPop {
            0% { transform: scale(0); }
            70% { transform: scale(1.2); }
            100% { transform: scale(1); }
        }

        h1 {
            color: var(--text-main);
            font-size: 2rem;
            font-weight: 800;
            margin-bottom: 12px;
            letter-spacing: -0.5px;
        }

        p {
            color: var(--text-muted);
            line-height: 1.6;
            margin-bottom: 25px;
        }

        .order-info {
            background-color: #f1f5f9;
            padding: 15px 25px;
            border-radius: 16px;
            display: inline-flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 35px;
            font-weight: 700;
            color: var(--text-main);
        }

        .order-id {
            color: var(--primary);
            font-family: monospace;
            font-size: 1.1rem;
        }

        .btn-group {
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        .btn {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            padding: 16px;
            border-radius: 14px;
            font-weight: 700;
            text-decoration: none;
            transition: all 0.3s ease;
            font-size: 1rem;
        }

        .btn-primary {
            background-color: var(--primary);
            color: white;
            box-shadow: 0 10px 15px -3px rgba(99, 102, 241, 0.3);
        }

        .btn-primary:hover {
            background-color: #4f46e5;
            transform: translateY(-2px);
            box-shadow: 0 20px 25px -5px rgba(99, 102, 241, 0.4);
        }

        .btn-secondary {
            background-color: #f8fafc;
            color: var(--text-main);
            border: 1px solid var(--border);
        }

        .btn-secondary:hover {
            background-color: #f1f5f9;
            transform: translateY(-2px);
        }

        /* Confetti effect imitation */
        .confetti {
            position: absolute;
            width: 10px;
            height: 10px;
            background: var(--primary);
            border-radius: 2px;
            opacity: 0;
            animation: confettiFall 2s ease-out infinite;
        }

        @keyframes confettiFall {
            0% { transform: translateY(-100px) rotate(0); opacity: 1; }
            100% { transform: translateY(200px) rotate(360deg); opacity: 0; }
        }
    </style>
</head>
<body>

    <div class="success-card">
        <div class="icon-container">
            <i data-lucide="check-circle-2" style="width: 50px; height: 50px;"></i>
        </div>

        <h1>Order Placed!</h1>
        <p>Hooray! Your order has been successfully placed. We'll notify you as soon as it's shipped.</p>

        <div class="order-info">
            <i data-lucide="hash" style="width: 18px; color: var(--text-muted);"></i>
            Order Number: <span class="order-id">${order_id}</span>
        </div>

        <div class="btn-group">
            <a href="${pageContext.request.contextPath}/getAllProducts" class="btn btn-primary">
                <i data-lucide="shopping-bag" style="width: 18px;"></i>
                Continue Shopping
            </a>
            <a href="${pageContext.request.contextPath}/user/orders" class="btn btn-secondary">
                <i data-lucide="package" style="width: 18px;"></i>
                View My Orders
            </a>
        </div>

        <div style="margin-top: 30px; font-size: 0.85rem; color: var(--text-muted); display: flex; align-items: center; justify-content: center; gap: 6px;">
            <i data-lucide="mail" style="width: 14px;"></i>
            A confirmation email is on its way.
        </div>
    </div>

    <script>
        // Initialize Lucide Icons
        lucide.createIcons();
    </script>
</body>
</html>