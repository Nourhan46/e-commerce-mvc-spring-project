<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart</title>
    <style>
        :root {
            --primary-color: #2563eb;
            --bg-color: #f8fafc;
            --card-bg: #ffffff;
            --text-main: #0f172a;
            --text-muted: #64748b;
            --border-color: #e2e8f0;
            --danger-color: #ef4444;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: var(--bg-color);
            color: var(--text-main);
            padding: 2rem 1rem;
        }

        .cart-container {
            max-width: 800px;
            margin: 0 auto;
            display: flex;
            flex-direction: column;
            gap: 2rem;
        }

        .cart-header {
            font-size: 1.8rem;
            margin-bottom: 1.5rem;
            font-weight: 700;
            color: var(--text-main);
        }

        .cart-item {
            background-color: var(--card-bg);
            border-radius: 12px;
            padding: 1.5rem;
            margin-bottom: 1rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 1px 3px rgba(0,0,0,0.05);
            border: 1px solid var(--border-color);
        }

        .item-details {
            flex: 1;
        }

        .item-title {
            font-size: 1.25rem;
            font-weight: 600;
            margin-bottom: 0.25rem;
            color: var(--text-main);
        }

        .item-price-unit {
            color: var(--text-muted);
            font-size: 0.95rem;
        }

        .item-controls {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        /* Simplified Quantity Input */
        .qty-input {
            width: 60px;
            padding: 0.5rem;
            border: 1px solid var(--border-color);
            border-radius: 6px;
            text-align: center;
            font-size: 1rem;
            font-weight: 600;
            color: var(--text-main);
            background-color: var(--bg-color);
            transition: border-color 0.2s;
        }

        .qty-input:focus {
            outline: none;
            border-color: var(--primary-color);
        }

        .remove-btn {
            background: none;
            border: none;
            color: var(--danger-color);
            cursor: pointer;
            font-weight: 600;
            font-size: 0.9rem;
            transition: all 0.2s;
            padding: 0.5rem 1rem;
            border-radius: 6px;
        }

        .remove-btn:hover {
            background-color: #fee2e2;
        }

        .empty-cart-msg {
            background-color: var(--card-bg);
            padding: 2rem;
            border-radius: 12px;
            text-align: center;
            color: var(--text-muted);
            border: 1px dashed var(--border-color);
        }

        .checkout-section {
            display: flex;
            justify-content: flex-end;
            padding-top: 1rem;
            border-top: 2px solid var(--border-color);
        }

        .checkout-btn {
            background-color: var(--primary-color);
            color: white;
            border: none;
            padding: 1rem 2rem;
            border-radius: 8px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.2s;
        }

        .checkout-btn:hover {
            background-color: #1d4ed8;
        }

        .checkout-btn:disabled {
            background-color: #94a3b8;
            cursor: not-allowed;
        }

        @media (max-width: 768px) {
            .cart-item {
                flex-direction: column;
                align-items: flex-start;
                gap: 1rem;
            }
            .item-controls {
                width: 100%;
                justify-content: space-between;
                border-top: 1px solid var(--border-color);
                padding-top: 1rem;
            }
            .checkout-section {
                justify-content: center;
            }
            .checkout-btn {
                width: 100%;
            }
        }
    </style>
</head>
<body>

    <div class="cart-container">

        <div class="cart-items">
            <h1 class="cart-header">Shopping Cart (${cartItems.size()})</h1>

            <c:if test="${empty cartItems}">
                <div class="empty-cart-msg">
                    <h2>Your cart is currently empty.</h2>
                </div>
            </c:if>

            <c:forEach var="item" items="${cartItems}">



                <div class="cart-item">
                    <div class="item-details">
                        <h3 class="item-title">${item.product.title}</h3>
                        <div class="item-price-unit">
                            Unit Price: <fmt:formatNumber value="${item.product.price}" type="currency" currencySymbol="$"/>
                        </div>
                    </div>

                    <div class="item-controls">
                        <form action="${pageContext.request.contextPath}/cart/update" method="POST">
                            <input type="hidden" name="productId" value="${item.product.id}">
                            <input type="number" name="quantity" class="qty-input"
                                   value="${item.quantity}" min="1" max="${item.product.stock}"
                                   title="Quantity" onchange="this.form.submit()">
                        </form>

                        <form action="${pageContext.request.contextPath}/cart/remove" method="POST">
                            <input type="hidden" name="productId" value="${item.product.id}">
                            <button type="submit" class="remove-btn">Remove</button>
                        </form>
                    </div>
                </div>
            </c:forEach>
        </div>

        <div class="checkout-section">
            <form action="${pageContext.request.contextPath}/checkout" method="GET" style="width: 100%;">
                <button type="submit" class="checkout-btn" <c:if test="${empty cartItems}">disabled</c:if>>
                    Proceed to Checkout
                </button>
            </form>
        </div>

    </div>

</body>
</html>