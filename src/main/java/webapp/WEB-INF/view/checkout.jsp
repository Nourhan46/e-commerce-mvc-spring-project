<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Secure Checkout</title>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <script src="https://unpkg.com/lucide@latest"></script>

    <style>
        :root {
            --primary: #4f46e5;
            --primary-light: #eef2ff;
            --bg: #f8fafc;
            --card-bg: #ffffff;
            --text-main: #0f172a;
            --text-muted: #64748b;
            --border: #e2e8f0;
            --success: #10b981;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Plus Jakarta Sans', sans-serif;
        }

        body {
            background-color: var(--bg);
            color: var(--text-main);
            padding: 40px 20px;
        }

        .checkout-container {
            max-width: 1000px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: 1fr 400px;
            gap: 30px;
        }

        h2, h3 {
            font-weight: 800;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .section-card {
            background: var(--card-bg);
            border-radius: 20px;
            padding: 30px;
            border: 1px solid var(--border);
            margin-bottom: 20px;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05);
        }

        /* Order Summary List */
        .summary-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 12px 0;
            border-bottom: 1px solid var(--border);
        }
        .summary-item:last-child { border-bottom: none; }

        .item-info-text .title { font-weight: 700; display: block; }
        .item-info-text .qty { font-size: 0.85rem; color: var(--text-muted); }

        .total-row {
            margin-top: 20px;
            padding-top: 20px;
            border-top: 2px dashed var(--border);
            display: flex;
            justify-content: space-between;
            font-size: 1.4rem;
            font-weight: 800;
        }

        /* Payment Methods Grid */
        .payment-grid {
            display: grid;
            grid-template-columns: 1fr;
            gap: 12px;
            margin-bottom: 25px;
        }

        .payment-option {
            position: relative;
        }

        .payment-option input[type="radio"] {
            position: absolute;
            opacity: 0;
            width: 100%;
            height: 100%;
            cursor: pointer;
            z-index: 2;
        }

        .payment-label {
            display: flex;
            align-items: center;
            gap: 15px;
            padding: 18px;
            border: 2px solid var(--border);
            border-radius: 12px;
            transition: 0.2s;
            font-weight: 600;
        }

        .payment-option input[type="radio"]:checked + .payment-label {
            border-color: var(--primary);
            background-color: var(--primary-light);
            color: var(--primary);
        }

        /* Form Inputs */
        .input-group { margin-bottom: 15px; }
        .input-group label {
            display: block;
            font-size: 0.85rem;
            font-weight: 700;
            margin-bottom: 6px;
        }

        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid var(--border);
            border-radius: 10px;
            font-size: 1rem;
            transition: 0.2s;
        }

        input:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 4px rgba(79, 70, 229, 0.1);
        }

        .submit-order-btn {
            width: 100%;
            background-color: var(--primary);
            color: white;
            padding: 18px;
            border: none;
            border-radius: 15px;
            font-size: 1.1rem;
            font-weight: 800;
            cursor: pointer;
            transition: 0.3s;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            margin-top: 20px;
        }

        .submit-order-btn:hover {
            background-color: #4338ca;
            transform: translateY(-2px);
            box-shadow: 0 10px 15px -3px rgba(79, 70, 229, 0.3);
        }

        /* Animated Fields */
        .payment-fields {
            background: #f1f5f9;
            padding: 20px;
            border-radius: 12px;
            margin-top: 10px;
            display: none;
            animation: slideDown 0.3s ease-out;
        }

        @keyframes slideDown {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @media (max-width: 850px) {
            .checkout-container { grid-template-columns: 1fr; }
        }
    </style>
</head>
<body>

    <div class="container">
        <h2 style="margin-bottom: 30px; margin-left: 20px;">
            <i data-lucide="shield-check" style="color: var(--success)"></i> Complete Your Purchase
        </h2>

        <form action="checkout" method="post" class="checkout-container">

            <div class="checkout-form">
                <div class="section-card">
                    <h3><i data-lucide="credit-card"></i> Payment Method</h3>
                    <p style="color: var(--text-muted); font-size: 0.9rem; margin-bottom: 20px;">
                        All transactions are secure and encrypted.
                    </p>

                    <div class="payment-grid">
                        <div class="payment-option">
                            <input type="radio" name="paymentMethod" value="credit_card" id="credit_card">
                            <div class="payment-label">
                                <i data-lucide="credit-card"></i> Credit / Debit Card
                            </div>
                        </div>

                        <div class="payment-option">
                            <input type="radio" name="paymentMethod" value="vodafone_cash" id="vodafone_cash">
                            <div class="payment-label">
                                <i data-lucide="phone"></i> Vodafone Cash
                            </div>
                        </div>

                        <div class="payment-option">
                            <input type="radio" name="paymentMethod" value="cash_on_delivery" id="cash_on_delivery" checked>
                            <div class="payment-label">
                                <i data-lucide="truck"></i> Cash on Delivery
                            </div>
                        </div>
                    </div>

                    <div id="creditCardFields" class="payment-fields">
                        <div class="input-group">
                            <label>Card Number</label>
                            <input type="text" name="cardNumber" placeholder="0000 0000 0000 0000">
                        </div>
                        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 15px;">
                            <div class="input-group">
                                <label>Expiry Date</label>
                                <input type="text" name="expiry" placeholder="MM/YY">
                            </div>
                            <div class="input-group">
                                <label>CVV</label>
                                <input type="text" name="cvv" placeholder="123">
                            </div>
                        </div>
                    </div>

                    <div id="vodafoneCashFields" class="payment-fields">
                        <div class="input-group">
                            <label>Vodafone Number</label>
                            <input type="text" name="vodafoneNumber" placeholder="010XXXXXXXX">
                        </div>
                    </div>
                </div>

                <button type="submit" class="submit-order-btn">
                    Place Order Now <i data-lucide="arrow-right"></i>
                </button>
            </div>

            <div class="order-summary">
                <div class="section-card">
                    <h3><i data-lucide="shopping-bag"></i> Order Summary</h3>

                    <div class="summary-list">
                        <c:forEach var="item" items="${cartItems}">
                            <div class="summary-item">
                                <div class="item-info-text">
                                    <span class="title">${item.product.title}</span>
                                    <span class="qty">Qty: ${item.quantity}</span>
                                </div>
                                <span style="font-weight: 600;">$${item.quantity * item.product.price}</span>
                            </div>
                        </c:forEach>
                    </div>

                    <div class="total-row">
                        <span>Total Amount</span>
                        <span style="color: var(--primary)">$${total}</span>
                    </div>

                    <div style="margin-top: 20px; font-size: 0.8rem; color: var(--text-muted); text-align: center;">
                        <i data-lucide="lock" style="width: 12px; vertical-align: middle;"></i>
                        Your data is protected by industry-standard encryption.
                    </div>
                </div>
            </div>
        </form>
    </div>

    <script>
        // Initialize Lucide Icons
        lucide.createIcons();

        // Payment Logic
        const radios = document.querySelectorAll('input[name="paymentMethod"]');
        const creditCardFields = document.getElementById('creditCardFields');
        const vodafoneCashFields = document.getElementById('vodafoneCashFields');

        radios.forEach(radio => {
            radio.addEventListener('change', function () {
                // Hide all first
                creditCardFields.style.display = 'none';
                vodafoneCashFields.style.display = 'none';

                // Show selected
                if (this.value === 'credit_card') {
                    creditCardFields.style.display = 'block';
                } else if (this.value === 'vodafone_cash') {
                    vodafoneCashFields.style.display = 'block';
                }
            });
        });
    </script>
</body>
</html>