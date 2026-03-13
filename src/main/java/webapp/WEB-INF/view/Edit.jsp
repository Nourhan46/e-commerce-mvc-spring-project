<form action="editProduct" method="post" modelAttribute="product">
    <input type="hidden" name="id" value="${product.id}" />

    <label for="title">title</label>
      <input type="text"  name="title" id="title" value="${product.title}" required>
      <label for="price">price</label>
            <input type="text"  name="price" id="price" value="${product.price}" required>

    <button type="submit">Save</button>







</form>