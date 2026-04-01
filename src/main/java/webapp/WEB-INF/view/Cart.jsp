<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Shopping Cart</title>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <script src="https://unpkg.com/lucide@latest"></script>

    <style>
        :root {
            --primary: #2563eb;
            --bg: #f8fafc;
            --card-bg: #ffffff;
            --text-main: #0f172a;
            --text-muted: #64748b;
            --border: #e2e8f0;
            --danger: #ef4444;
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

        .container {
            max-width: 1100px;
            margin: 0 auto;
        }

        .cart-title {
            font-size: 2rem;
            font-weight: 800;
            margin-bottom: 30px;
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .cart-wrapper {
            display: grid;
            grid-template-columns: 1fr 350px;
            gap: 30px;
            align-items: start;
        }

        /* Cart Items Section */
        .cart-items-list {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .cart-item {
            background: var(--card-bg);
            border-radius: 16px;
            padding: 20px;
            display: flex;
            align-items: center;
            gap: 20px;
            border: 1px solid var(--border);
            transition: all 0.2s;
        }

        .cart-item:hover {
            border-color: var(--primary);
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
        }

        /* Image Styling */
        .item-img-container {
            width: 100px;
            height: 100px;
            background: #f1f5f9;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
            flex-shrink: 0;
            padding: 10px;
        }

        .item-img-container img {
            max-width: 100%;
            max-height: 100%;
            object-fit: contain;
        }

        .item-info {
            flex: 1;
        }

        .item-title {
            font-size: 1.1rem;
            font-weight: 700;
            margin-bottom: 5px;
        }

        .item-price {
            color: var(--primary);
            font-weight: 700;
            font-size: 1.1rem;
        }

        /* Controls Area */
        .item-actions {
            display: flex;
            flex-direction: column;
            align-items: flex-end;
            gap: 15px;
        }

        .qty-form {
            display: flex;
            align-items: center;
            gap: 10px;
            background: #f1f5f9;
            padding: 5px 10px;
            border-radius: 8px;
        }

        .qty-input {
            width: 45px;
            border: none;
            background: transparent;
            text-align: center;
            font-weight: 700;
            font-size: 1rem;
            color: var(--text-main);
        }

        /* Hide arrows on number input */
        .qty-input::-webkit-inner-spin-button { -webkit-appearance: none; }

        .remove-link {
            color: var(--danger);
            text-decoration: none;
            font-size: 0.85rem;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 4px;
            transition: 0.2s;
        }

        .remove-link:hover { opacity: 0.7; }

        /* Summary Sidebar */
        .cart-summary {
            background: var(--card-bg);
            border-radius: 20px;
            padding: 25px;
            border: 1px solid var(--border);
            position: sticky;
            top: 20px;
        }

        .summary-title {
            font-size: 1.25rem;
            font-weight: 700;
            margin-bottom: 20px;
            padding-bottom: 15px;
            border-bottom: 1px solid var(--border);
        }

        .summary-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
            font-weight: 500;
            color: var(--text-muted);
        }

        .summary-total {
            border-top: 2px dashed var(--border);
            margin-top: 15px;
            padding-top: 15px;
            display: flex;
            justify-content: space-between;
            font-size: 1.3rem;
            font-weight: 800;
            color: var(--text-main);
        }

        .checkout-btn {
            display: block;
            width: 100%;
            background: var(--primary);
            color: white;
            text-align: center;
            padding: 16px;
            border-radius: 12px;
            text-decoration: none;
            font-weight: 700;
            margin-top: 25px;
            transition: 0.3s;
            border: none;
            cursor: pointer;
        }

        .checkout-btn:hover { background: #1d4ed8; transform: translateY(-2px); }
        .checkout-btn:disabled { background: #cbd5e1; cursor: not-allowed; transform: none; }

        .empty-state {
            text-align: center;
            padding: 60px;
            background: white;
            border-radius: 20px;
            border: 1px dashed var(--text-muted);
        }

        @media (max-width: 900px) {
            .cart-wrapper { grid-template-columns: 1fr; }
            .cart-summary { position: static; }
        }
    </style>
</head>
<body>

    <div class="container">
        <h1 class="cart-title">
            <i data-lucide="shopping-cart"></i>
            Shopping Cart <span style="color: var(--text-muted); font-size: 1.2rem;">(${cartItems.size()} items)</span>
        </h1>

        <c:choose>
            <c:when test="${empty cartItems}">
                <div class="empty-state">
                    <i data-lucide="shopping-bag" style="width: 60px; height: 60px; color: var(--text-muted); margin-bottom: 20px;"></i>
                    <h2>Your cart is feeling lonely</h2>
                    <p style="color: var(--text-muted); margin: 10px 0 25px;">Add some amazing products to your cart!</p>
                    <a href="getAllProducts" class="checkout-btn" style="display: inline-block; width: auto; padding: 12px 30px;">Back to Shop</a>
                </div>
            </c:when>
            <c:otherwise>
                <div class="cart-wrapper">
                    <div class="cart-items-list">
                        <c:forEach var="item" items="${cartItems}">
                            <div class="cart-item">
                                <div class="item-img-container">
                                    <c:choose>
                                        <c:when test="${not empty item.product.imageUrl}">
                                            <img src="${pageContext.request.contextPath}/images/${item.product.imageUrl}"
                                                 alt="${item.product.title}"
                                                 onerror="this.src='https://placehold.co/100x100?text=No+Image';">
                                        </c:when>
                                        <c:otherwise>
                                            <i data-lucide="image" style="color: var(--text-muted);"></i>
                                        </c:otherwise>
                                    </c:choose>
                                </div>

                                <div class="item-info">
                                    <h3 class="item-title">${item.product.title}</h3>
                                    <p class="item-price">$${item.product.price}</p>
                                    <p style="font-size: 0.75rem; color: var(--text-muted); margin-top: 4px;">In Stock: ${item.product.stock}</p>
                                </div>

                                <div class="item-actions">
                                    <form action="${pageContext.request.contextPath}/cart/update" method="POST" class="qty-form">
                                        <input type="hidden" name="productId" value="${item.product.id}">
                                        <label style="font-size: 0.8rem; font-weight: 600;">Qty:</label>
                                        <input type="number" name="quantity" class="qty-input"
                                               value="${item.quantity}" min="1" max="${item.product.stock}"
                                               onchange="this.form.submit()">
                                    </form>

                                    <form action="${pageContext.request.contextPath}/cart/remove" method="POST">
                                        <input type="hidden" name="productId" value="${item.product.id}">
                                      <input type="hidden" name="cart_id" value="${param.cart_id}">
                                        <button type="submit" class="remove-link" style="background:none; border:none; cursor:pointer;">
                                            <i data-lucide="trash-2" style="width: 14px;"></i> Remove
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                    <div class="cart-summary">
                        <h2 class="summary-title">Order Summary</h2>

                        <div class="summary-row">
                            <span>Subtotal</span>
                            <span>$${totalPrice}</span>
                        </div>
                        <div class="summary-row">
                            <span>Shipping</span>
                            <span style="color: var(--success);">Free</span>
                        </div>
                        <div class="summary-row">
                            <span>Tax (Estimated)</span>
                            <span>$0.00</span>
                        </div>

                        <div class="summary-total">
                            <span>Total</span>
                            <span>$${totalPrice}</span>
                        </div>

                        <form action="${pageContext.request.contextPath}/checkout" method="GET">
                            <button type="submit" class="checkout-btn">
                                Proceed to Checkout
                            </button>
                        </form>

                        <div style="margin-top: 20px; display: flex; align-items: center; justify-content: center; gap: 8px; color: var(--text-muted); font-size: 0.85rem;">
                            <i data-lucide="shield-check" style="width: 16px;"></i> Secure Checkout
                        </div>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <script>
        // Initialize Lucide Icons
        lucide.createIcons();
    </script>
</body>
</html>