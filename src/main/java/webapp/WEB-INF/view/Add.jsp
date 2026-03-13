<form action="Add" method="post" modelAttribute="product">


    <label for="title">title</label>
      <input type="text"  name="title" id="title" value="${product.title}" required>
      <label for="price">price</label>
            <input type="text"  name="price" id="price" value="${product.price}" required>

       <label for="stock">stock</label>
       <input type="text"  name="stock" id="stock" value="${product.stock}" required>

    <button type="submit">Save</button>





</form>