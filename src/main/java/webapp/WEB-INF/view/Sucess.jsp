<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Order Success</title>
    <style>
        body { font-family: sans-serif; text-align: center; padding: 50px; background: #f4f7f6; }
        .success-card { background: white; padding: 40px; border-radius: 10px; display: inline-block; box-shadow: 0 4px 6px rgba(0,0,0,0.1); }
        .icon { font-size: 50px; color: #2ecc71; }
        h1 { color: #2c3e50; }
        .order-id { font-weight: bold; color: #3498db; font-size: 1.2rem; }
        .btn { display: inline-block; margin-top: 20px; padding: 10px 20px; background: #3498db; color: white; text-decoration: none; border-radius: 5px; }
    </style>
</head>
<body>
    <div class="success-card">
        <div class="icon">✔</div>
        <h1>Order Placed Successfully!</h1>
        <p>Thank you for your purchase. Your order has been received.</p>

        <p>Order Number: <span class="order-id">${order_id}</span></p>

        <a href="${pageContext.request.contextPath}/home" class="btn">Continue Shopping</a>
        <a href="${pageContext.request.contextPath}/user/orders" class="btn" style="background: #95a5a6;">View My Orders</a>
    </div>
</body>
</html>