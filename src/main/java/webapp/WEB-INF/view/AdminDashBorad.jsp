<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <style>
        :root {
            --primary: #4f46e5;
            --danger: #ef4444;
            --success: #10b981;
            --warning: #f59e0b;
            --bg: #f9fafb;
            --text: #111827;
        }

        body {
            font-family: 'Inter', system-ui, sans-serif;
            background-color: var(--bg);
            padding: 40px;
            color: var(--text);
        }

        .container {
            max-width: 950px;
            margin: 0 auto;
            background: white;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th {
            background-color: #f3f4f6;
            color: #6b7280;
            text-align: left;
            padding: 12px 15px;
            font-size: 0.85rem;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            border-bottom: 2px solid #e5e7eb;
        }

        td {
            padding: 15px;
            border-bottom: 1px solid #f3f4f6;
            font-size: 0.95rem;
        }

        tr:hover { background-color: #f9fafb; }

        .row-deleted {
            opacity: 0.5;
            background-color: #f3f4f6;
        }

        .badge {
            padding: 4px 8px;
            border-radius: 12px;
            font-size: 0.75rem;
            font-weight: bold;
        }
        .badge-active { background-color: #d1fae5; color: #065f46; }
        .badge-deleted { background-color: #fee2e2; color: #991b1b; }

        .btn {
            text-decoration: none;
            padding: 6px 12px;
            border-radius: 6px;
            font-size: 0.85rem;
            font-weight: 600;
            transition: 0.2s;
            display: inline-block;
        }

        .btn-add { background-color: var(--primary); color: white; padding: 10px 20px; }
        .btn-edit { background-color: #e0e7ff; color: var(--primary); margin-right: 5px; }
        .btn-edit:hover { background-color: var(--primary); color: white; }
        .btn-delete { background-color: #fee2e2; color: var(--danger); }
        .btn-delete:hover { background-color: var(--danger); color: white; }

        .btn-disabled { background-color: #e5e7eb; color: #9ca3af; cursor: not-allowed; }

    </style>
</head>
<body>

<div class="container">
    <div class="header">
        <h2>Product Management</h2>
        <a href="Add" class="btn btn-add">+ Add New Product</a>
    </div>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Product Title</th>
                <th>Price</th>
                <th>Stock</th>
                <th>Status</th>
                <th style="text-align: center;">Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="product" items="${products}">

                <tr class="${product.is_active ? '' : 'row-deleted'}">
                    <td>#${product.id}</td>
                    <td style="font-weight: 500;">${product.title}</td>
                    <td style="color: var(--success); font-weight: bold;">${product.price}</td>
                    <td style="font-weight: 500;">${product.stock}</td>

                    <td>
                        <c:choose>
                            <c:when test="${product.is_active}">
                                <span class="badge badge-active">Active</span>
                            </c:when>
                            <c:otherwise>
                                <span class="badge badge-deleted">Deleted</span>
                            </c:otherwise>
                        </c:choose>
                    </td>

                    <td style="text-align: center;">
                        <a href="Edit?id=${product.id}" class="btn btn-edit">Edit</a>

                        <c:if test="${product.is_active}">
                            <a href="Delete?id=${product.id}" class="btn btn-delete"
                               onclick="return confirm('Are you sure you want to delete this product?')">Delete</a>
                        </c:if>

                        <c:if test="${!product.is_active}">
                            <span class="btn btn-disabled">Deleted</span>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>