<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Products List</title>
    <style>
        :root {
            --primary-color: #2563eb;
            --bg-color: #f8fafc;
            --card-bg: #ffffff;
            --text-main: #0f172a;
            --text-muted: #64748b;
            --border-color: #e2e8f0;
            --success-color: #10b981; /* Green for add button */
            --danger-color: #ef4444; /* Red for out of stock */
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
            padding: 3rem 1rem;
        }

        .container {
            max-width: 900px;
            margin: 0 auto;
        }

        h1 {
            margin-bottom: 2rem;
            color: var(--text-main);
            font-size: 2rem;
        }

        /* Modern Table Styles */
        .product-table {
            width: 100%;
            border-collapse: collapse;
            background-color: var(--card-bg);
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
        }

        .product-table th,
        .product-table td {
            padding: 1.2rem 1rem;
            text-align: left;
            border-bottom: 1px solid var(--border-color);
        }

        .product-table th {
            background-color: var(--primary-color);
            color: white;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.9rem;
            letter-spacing: 0.5px;
        }

        .product-table tr:last-child td {
            border-bottom: none;
        }

        .product-table tbody tr:hover {
            background-color: #f1f5f9;
            transition: background-color 0.2s;
        }

        .product-title {
            font-weight: 600;
            font-size: 1.1rem;
        }

        .product-price {
            font-weight: bold;
            color: var(--text-main);
        }

        /* Stock Badge Styles */
        .stock-badge {
            display: inline-block;
            padding: 0.25rem 0.75rem;
            border-radius: 20px;
            font-size: 0.85rem;
            font-weight: 600;
            background-color: #e2e8f0;
            color: var(--text-muted);
        }

        .stock-badge.out-of-stock {
            background-color: #fee2e2;
            color: var(--danger-color);
        }

        /* Button Styles */
        .btn-add {
            display: inline-block;
            background-color: var(--success-color);
            color: white;
            padding: 0.6rem 1.2rem;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 600;
            font-size: 0.9rem;
            transition: background-color 0.2s;
        }

        .btn-add:hover {
            background-color: #059669;
        }

        .btn-add.disabled {
            background-color: #94a3b8;
            pointer-events: none; /* Prevents clicking */
        }

        .btn-cart {
            display: inline-block;
            background-color: var(--primary-color);
            color: white;
            padding: 1rem 2rem;
            border-radius: 8px;
            text-decoration: none;
            font-weight: bold;
            font-size: 1.1rem;
            margin-top: 2rem;
            transition: background-color 0.2s;
            box-shadow: 0 2px 4px rgba(37, 99, 235, 0.3);
        }

        .btn-cart:hover {
            background-color: #1d4ed8;
        }

        @media (max-width: 600px) {
            .product-table th, .product-table td {
                padding: 0.8rem 0.5rem;
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>Available Products</h1>

        <table class="product-table">
            <thead>
                <tr>
                    <th>Title</th>
                    <th>Price</th>
                    <th>Stock</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="product" items="${products}">
                    <tr>
                        <td class="product-title">${product.title}</td>
                        <td class="product-price">$${product.price}</td>

                        <td>
                            <span class="stock-badge ${product.stock == 0 ? 'out-of-stock' : ''}">
                                <c:choose>
                                    <c:when test="${product.stock > 0}">
                                        ${product.stock} in stock
                                    </c:when>
                                    <c:otherwise>
                                        Out of Stock
                                    </c:otherwise>
                                </c:choose>
                            </span>
                        </td>

                        <td>
                            <a href="AddCart?id=${product.id}" class="btn-add ${product.stock == 0 ? 'disabled' : ''}">
                                Add to Cart
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <a href="Cart" class="btn-cart">View Cart 🛒</a>
    </div>

</body>
</html>