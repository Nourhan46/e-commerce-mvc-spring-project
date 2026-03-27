<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Product</title>
    <style>
        :root {
            --primary-color: #4f46e5;
            --primary-hover: #4338ca;
            --bg-color: #f3f4f6;
            --card-bg: #ffffff;
            --text-main: #1f2937;
            --border-color: #d1d5db;
        }

        body {
            background-color: var(--bg-color);
            font-family: 'Segoe UI', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .form-container {
            background: var(--card-bg);
            padding: 2rem;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.05);
            width: 100%;
            max-width: 400px;
        }

        .form-header {
            margin-bottom: 1.5rem;
            text-align: center;
            border-bottom: 1px solid #eee;
            padding-bottom: 10px;
        }

        .form-group {
            margin-bottom: 1rem;
        }

        label {
            display: block;
            font-size: 0.9rem;
            font-weight: 600;
            color: #4b5563;
            margin-bottom: 0.4rem;
        }

        input {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid var(--border-color);
            border-radius: 8px;
            box-sizing: border-box;
            transition: 0.2s;
        }

        input:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(79, 70, 229, 0.1);
        }

        /* حقل الـ ID المخفي لا يظهر لكنه موجود */
        .hidden { display: none; }

        button {
            width: 100%;
            background-color: var(--primary-color);
            color: white;
            padding: 0.8rem;
            border: none;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
            margin-top: 1rem;
        }

        button:hover { background-color: var(--primary-hover); }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 15px;
            font-size: 0.85rem;
            color: #6b7280;
            text-decoration: none;
        }
    </style>
</head>
<body>

<div class="form-container">
    <div class="form-header">
        <h2>Edit Product #${product.id}</h2>
    </div>

    <form action="editProduct" method="post">
        <input type="hidden" name="id" value="${product.id}" />

        <div class="form-group">
            <label for="title">Product Title</label>
            <input type="text" name="title" id="title" value="${product.title}" required>
        </div>

        <div class="form-group">
            <label for="price">Price ($)</label>
            <input type="number" step="0.01" name="price" id="price" value="${product.price}" required>
        </div>

        <div class="form-group">
            <label for="stock">Stock Quantity</label>
            <input type="number" name="stock" id="stock" value="${product.stock}" required>
        </div>

        <button type="submit">Update Product</button>
        <a href="list" class="back-link">← Cancel and Go Back</a>
    </form>
</div>

</body>
</html>