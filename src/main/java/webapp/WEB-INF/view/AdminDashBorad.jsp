<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inventory | Product Management</title>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
    <script src="https://unpkg.com/lucide@latest"></script>

    <style>
        :root {
            --primary: #6366f1;
            --primary-hover: #4f46e5;
            --danger: #ef4444;
            --success: #22c55e;
            --warning: #f59e0b;
            --bg: #f8fafc;
            --card-bg: #ffffff;
            --text-main: #1e293b;
            --text-muted: #64748b;
            --border: #e2e8f0;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Plus Jakarta Sans', sans-serif;
            background-color: var(--bg);
            color: var(--text-main);
            line-height: 1.5;
            padding: 2rem;
        }

        .container {
            max-width: 1100px;
            margin: 0 auto;
            background: var(--card-bg);
            border-radius: 16px;
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.05);
            border: 1px solid var(--border);
            overflow: hidden;
        }

        .header {
            padding: 1.5rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid var(--border);
            background: white;
        }

        .header h2 {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--text-main);
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .btn {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 0.6rem 1.2rem;
            border-radius: 8px;
            font-size: 0.875rem;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.2s;
            cursor: pointer;
            border: none;
        }

        .btn-add {
            background-color: var(--primary);
            color: white;
        }

        .btn-add:hover {
            background-color: var(--primary-hover);
            transform: translateY(-1px);
        }

        .table-container {
            width: 100%;
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            background-color: #fcfcfd;
            padding: 1rem 1.5rem;
            text-align: left;
            font-size: 0.75rem;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            color: var(--text-muted);
            border-bottom: 1px solid var(--border);
        }

        td {
            padding: 1.25rem 1.5rem;
            border-bottom: 1px solid var(--border);
            vertical-align: middle;
        }

        tr:last-child td { border-bottom: none; }
        tr:hover { background-color: #fbfcfe; }

        /* Image Styling */
        .product-img-wrapper {
            width: 64px;
            height: 64px;
            border-radius: 10px;
            background: #f1f5f9;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
            border: 1px solid var(--border);
        }

        .product-img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .img-placeholder {
            color: var(--text-muted);
            font-size: 0.6rem;
            text-align: center;
            padding: 4px;
        }

        .price-tag {
            font-weight: 700;
            color: var(--text-main);
        }

        .stock-badge {
            font-size: 0.85rem;
            padding: 2px 8px;
            background: #f1f5f9;
            border-radius: 6px;
            color: var(--text-muted);
        }

        .badge {
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 0.75rem;
            font-weight: 600;
            display: inline-block;
        }

        .badge-active { background: #dcfce7; color: #166534; }
        .badge-deleted { background: #fee2e2; color: #991b1b; }

        .actions {
            display: flex;
            gap: 8px;
            justify-content: flex-end;
        }

        .btn-edit { background: #f1f5f9; color: var(--text-main); }
        .btn-edit:hover { background: #e2e8f0; }

        .btn-delete { background: #fff1f2; color: var(--danger); }
        .btn-delete:hover { background: var(--danger); color: white; }

        .btn-disabled { opacity: 0.5; cursor: not-allowed; background: #f1f5f9; color: var(--text-muted); }

        .row-deleted { background-color: #fdfdfd; }
        .row-deleted td { color: var(--text-muted); }
    </style>
</head>
<body>

<div class="container">
    <div class="header">
        <h2><i data-lucide="package"></i> Product Inventory</h2>
        <a href="Add" class="btn btn-add">
            <i data-lucide="plus"></i> Add New Product
        </a>
    </div>

    <div class="table-container">
        <table>
            <thead>
                <tr>
                    <th>Product Info</th>
                    <th>Price</th>
                    <th>Stock</th>
                    <th>Status</th>
                    <th style="text-align: right;">Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="product" items="${products}">
                    <tr class="${product.is_active ? '' : 'row-deleted'}">
                        <td>
                            <div style="display: flex; align-items: center; gap: 15px;">
                                <div class="product-img-wrapper">
                                    <c:choose>
                                        <c:when test="${not empty product.imageUrl}">
                                            <img src="${pageContext.request.contextPath}/images/${product.imageUrl}"
                                                 alt="${product.title}"
                                                 class="product-img"
                                                 onerror="this.src='https://placehold.co/100x100?text=No+Image';">
                                        </c:when>
                                        <c:otherwise>
                                            <div class="img-placeholder">
                                                <i data-lucide="image-off" style="width: 20px;"></i>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div>
                                    <div style="font-weight: 600; color: var(--text-main);">${product.title}</div>
                                    <div style="font-size: 0.75rem; color: var(--text-muted);">ID: #${product.id}</div>
                                </div>
                            </div>
                        </td>

                        <td><span class="price-tag">$${product.price}</span></td>

                        <td><span class="stock-badge">${product.stock} in units</span></td>

                        <td>
                            <c:choose>
                                <c:when test="${product.is_active}">
                                    <span class="badge badge-active">Active</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge badge-deleted">Archived</span>
                                </c:otherwise>
                            </c:choose>
                        </td>

                        <td class="actions">
                            <a href="Edit?id=${product.id}" class="btn btn-edit" title="Edit">
                                <i data-lucide="edit-3" style="width: 16px;"></i>
                            </a>

                            <c:if test="${product.is_active}">
                                <a href="Delete?id=${product.id}" class="btn btn-delete"
                                   onclick="return confirm('Archive this product?')" title="Delete">
                                    <i data-lucide="trash-2" style="width: 16px;"></i>
                                </a>
                            </c:if>

                            <c:if test="${!product.is_active}">
                                <span class="btn btn-disabled"><i data-lucide="lock" style="width: 16px;"></i></span>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<script>
    // Initialize Lucide icons
    lucide.createIcons();
</script>

</body>
</html>