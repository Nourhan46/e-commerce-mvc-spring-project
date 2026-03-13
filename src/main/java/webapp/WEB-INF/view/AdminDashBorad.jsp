<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<table border="2">
<tr>
<td>Id</td>
<td>title</td>
<td>price</td>
<td>Edit</td>
<td>Delete</td>
</tr>

<c:forEach var="product" items="${products}">
<tr>
<td>${product.id}</td>
<td>${product.title}</td>
<td>${product.price}</td>
<td><a href="Edit?id=${product.id}">edit</a></td>
<td><a href="Delete?id=${product.id}">delete</a></td>
</tr>
</c:forEach>

</table>

<a href="Add">Add</a>



