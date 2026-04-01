<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Premium Store | Gallery</title>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">

    <style>
        :root {
            --primary: #2563eb;
            --primary-dark: #1d4ed8;
            --bg: #f8fafc;
            --card-bg: #ffffff;
            --text-main: #0f172a;
            --text-muted: #64748b;
            --success: #10b981;
            --danger: #ef4444;
            --border: #e2e8f0;
            --shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.04), 0 4px 6px -2px rgba(0, 0, 0, 0.02);
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            background-color: var(--bg);
            color: var(--text-main);
            font-family: 'Plus Jakarta Sans', sans-serif;
            padding: 40px 20px;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        .header h1 {
            font-size: 2rem;
            font-weight: 800;
            letter-spacing: -0.5px;
        }

        /* Cart Button */
        .btn-cart-floating {
            background-color: var(--text-main);
            color: white;
            padding: 12px 24px;
            border-radius: 12px;
            text-decoration: none;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 10px;
            transition: all 0.3s ease;
        }

        .btn-cart-floating:hover {
            transform: translateY(-2px);
            background-color: #000;
        }

        /* Search Bar */
        .search-container {
            margin-bottom: 40px;
            display: flex;
            justify-content: center;
        }

        .search-form {
            display: flex;
            width: 100%;
            max-width: 600px;
            background: var(--card-bg);
            border: 1px solid var(--border);
            border-radius: 12px;
            overflow: hidden;
            transition: all 0.3s ease;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.02);
        }

        .search-form:focus-within {
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.1);
        }

        .search-input {
            flex-grow: 1;
            border: none;
            padding: 14px 20px;
            font-size: 1rem;
            font-family: inherit;
            color: var(--text-main);
            outline: none;
            background: transparent;
        }

        .search-input::placeholder {
            color: var(--text-muted);
        }

        .search-btn {
            background-color: var(--primary);
            color: white;
            border: none;
            padding: 0 24px;
            font-weight: 600;
            font-family: inherit;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.2s;
        }

        .search-btn:hover {
            background-color: var(--primary-dark);
        }

        /* Grid */
        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(260px, 1fr));
            gap: 25px;
        }

        /* Card Design */
        .product-card {
            background: var(--card-bg);
            border-radius: 20px;
            border: 1px solid var(--border);
            overflow: hidden;
            display: flex;
            flex-direction: column;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }

        .product-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1);
            border-color: transparent;
        }

        /* Image Handling */
        .image-container {
            width: 100%;
            height: 240px;
            background-color: #f1f5f9;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            position: relative;
        }

        .product-image {
            max-width: 100%;
            max-height: 100%;
            object-fit: contain;
            transition: transform 0.5s ease;
        }

        .product-card:hover .product-image {
            transform: scale(1.05);
        }

        /* Card Content */
        .card-body {
            padding: 20px;
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .product-title {
            font-size: 1.1rem;
            font-weight: 700;
            color: var(--text-main);
            min-height: 2.2em;
        }

        .product-price {
            font-size: 1.4rem;
            font-weight: 800;
            color: var(--primary);
        }

        .stock-badge {
            display: inline-block;
            padding: 4px 12px;
            border-radius: 8px;
            font-size: 0.75rem;
            font-weight: 700;
            width: fit-content;
        }

        .in-stock { background: #dcfce7; color: #166534; }
        .out-stock { background: #fee2e2; color: #991b1b; }

        /* Add to Cart Button */
        .btn-add {
            margin-top: 15px;
            background-color: var(--primary);
            color: white;
            text-align: center;
            padding: 14px;
            border-radius: 12px;
            text-decoration: none;
            font-weight: 700;
            transition: 0.2s;
        }

        .btn-add:hover {
            background-color: var(--primary-dark);
        }

        .btn-add.disabled {
            background-color: #e2e8f0;
            color: #94a3b8;
            pointer-events: none;
        }

    </style>
</head>
<body>

    <div class="container">
        <div class="header">
            <h1>Explore Products</h1>
            <a href="Cart" class="btn-cart-floating">
                View Cart 🛒
            </a>
        </div>

        <div class="search-container">
            <form action="" method="GET" class="search-form">
                <input type="text" name="search" class="search-input" placeholder="Search for products..." value="${param.search}">
                <button type="submit" class="search-btn">Search</button>
            </form>
        </div>

        <div class="product-grid">
            <c:forEach var="product" items="${products}">
                <div class="product-card">
                    <div class="image-container">
                        <c:choose>
                            <c:when test="${not empty product.imageUrl}">
                                <img src="${pageContext.request.contextPath}/images/${product.imageUrl}"
                                     alt="${product.title}"
                                     class="product-image"
                                     onerror="this.src='https://placehold.co/400x400?text=No+Image';">
                            </c:when>
                            <c:otherwise>
                                <img src="https://placehold.co/400x400?text=No+Image" class="product-image">
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <div class="card-body">
                        <h2 class="product-title">${product.title}</h2>
                        <p class="product-price">$${product.price}</p>

                        <c:choose>
                            <c:when test="${product.stock > 0}">
                                <span class="stock-badge in-stock">● ${product.stock} in stock</span>
                                <a href="AddCart?id=${product.id}" class="btn-add">Add to Cart</a>
                            </c:when>
                            <c:otherwise>
                                <span class="stock-badge out-stock">● Out of Stock</span>
                                <a href="#" class="btn-add disabled">Out of Stock</a>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </c:forEach>

            <c:if test="${empty products}">
                <div style="grid-column: 1 / -1; text-align: center; padding: 40px; color: var(--text-muted);">
                    <h3>No products found matching your search.</h3>
                </div>
            </c:if>
        </div>
    </div>

</body>
</html>