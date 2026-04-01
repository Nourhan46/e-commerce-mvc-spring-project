<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Product | Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">

    <style>
        :root {
            --primary: #4f46e5;
            --primary-hover: #4338ca;
            --bg: #f8fafc;
            --card-bg: #ffffff;
            --text-main: #1e293b;
            --text-muted: #64748b;
            --border: #e2e8f0;
        }

        body {
            background-color: var(--bg);
            font-family: 'Plus Jakarta Sans', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            padding: 20px;
        }

        .form-container {
            background: var(--card-bg);
            padding: 2.5rem;
            border-radius: 20px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.05);
            width: 100%;
            max-width: 450px;
            border: 1px solid var(--border);
        }

        .form-header {
            margin-bottom: 2rem;
            text-align: center;
        }

        .form-header h2 {
            font-size: 1.5rem;
            font-weight: 800;
            color: var(--text-main);
            margin-bottom: 5px;
        }

        .form-header p {
            color: var(--text-muted);
            font-size: 0.9rem;
        }

        .form-group {
            margin-bottom: 1.25rem;
        }

        label {
            display: block;
            font-size: 0.85rem;
            font-weight: 700;
            color: var(--text-main);
            margin-bottom: 0.5rem;
        }

        input {
            width: 100%;
            padding: 0.8rem 1rem;
            border: 1px solid var(--border);
            border-radius: 10px;
            font-size: 0.95rem;
            transition: 0.2s;
            background: #fbfcfe;
        }

        input:focus {
            outline: none;
            border-color: var(--primary);
            background: white;
            box-shadow: 0 0 0 4px rgba(79, 70, 229, 0.1);
        }

        /* تنسيق معاينة الصورة الحالية */
        .image-preview-section {
            background: #f1f5f9;
            padding: 15px;
            border-radius: 12px;
            text-align: center;
            margin-bottom: 1.5rem;
            border: 1px dashed var(--border);
        }

        .current-img {
            max-width: 120px;
            height: 120px;
            object-fit: contain;
            border-radius: 8px;
            background: white;
            box-shadow: 0 2px 5px rgba(0,0,0,0.05);
        }

        .file-info {
            font-size: 0.75rem;
            color: var(--text-muted);
            margin-top: 8px;
        }

        button {
            width: 100%;
            background-color: var(--primary);
            color: white;
            padding: 1rem;
            border: none;
            border-radius: 12px;
            font-weight: 700;
            font-size: 1rem;
            cursor: pointer;
            transition: 0.3s;
            margin-top: 1rem;
        }

        button:hover {
            background-color: var(--primary-hover);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(79, 70, 229, 0.2);
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            font-size: 0.9rem;
            color: var(--text-muted);
            text-decoration: none;
            font-weight: 500;
            transition: 0.2s;
        }

        .back-link:hover { color: var(--text-main); }
    </style>
</head>
<body>

<div class="form-container">
    <div class="form-header">
        <h2>Update Product</h2>
        <p>Modify the details for product #${product.id}</p>
    </div>

    <form action="editProduct" method="post" enctype="multipart/form-data">

        <input type="hidden" name="id" value="${product.id}" />

        <div class="image-preview-section">
            <label style="text-align: left;">Current Image</label>
            <c:choose>
                <c:when test="${not empty product.imageUrl}">
                    <img src="${pageContext.request.contextPath}/images/${product.imageUrl}"
                         alt="Current Product" class="current-img"
                         onerror="this.src='https://placehold.co/150x150?text=No+Image';">
                </c:when>
                <c:otherwise>
                    <div style="padding: 20px; color: var(--text-muted);">No image uploaded</div>
                </c:otherwise>
            </c:choose>
            <div class="file-info">You can keep this or upload a new one below</div>
        </div>

        <div class="form-group">
            <label for="title">Product Name</label>
            <input type="text" name="title" id="title" value="${product.title}" placeholder="e.g. iPhone 15 Pro" required>
        </div>

        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 15px;">
            <div class="form-group">
                <label for="price">Price ($)</label>
                <input type="number" step="0.01" name="price" id="price" value="${product.price}" placeholder="0.00" required>
            </div>

            <div class="form-group">
                <label for="stock">In Stock</label>
                <input type="number" name="stock" id="stock" value="${product.stock}" placeholder="Quantity" required>
            </div>
        </div>

        <div class="form-group">
            <label for="productImage">Upload New Image <small style="color: var(--primary);">(Optional)</small></label>
            <input type="file" name="productImage" id="productImage" accept="image/*">
        </div>

        <button type="submit">Save Changes</button>
        <a href="getAllProducts" class="back-link">← Cancel and Back to List</a>
    </form>
</div>

</body>
</html>