<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Product</title>
    <style>
        body {
            background: #f0f2f5;
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            padding-top: 50px;
        }
        form {
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            width: 350px;
        }
        h2 { text-align: center; color: #333; margin-bottom: 20px; }
        label { display: block; margin: 10px 0 5px; font-weight: bold; color: #555; }
        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-sizing: border-box; /* ده اللي بيظبط المقاسات */
        }
        button {
            width: 100%;
            padding: 12px;
            background: #007bff;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            transition: 0.3s;
        }
        button:hover { background: #0056b3; }
    </style>
</head>
<body>

<form action="Add" method="post" enctype="multipart/form-data">
    <h2>Add New Product</h2>

    <label for="title">Product Name</label>
    <input type="text" name="title" id="title" value="${product.title}" required placeholder="e.g. iPhone 15">

    <label for="price">Price ($)</label>
    <input type="number" step="0.01" name="price" id="price" value="${product.price}" required placeholder="0.00">

    <label for="stock">Stock Quantity</label>
    <input type="number" name="stock" id="stock" value="${product.stock}" required placeholder="Quantity">
    <label>Product Image:</label>
    <input type="file" name="productImage" accept="image/png, image/jpeg" required />
    <button type="submit">Save Product</button>
</form>

</body>
</html>