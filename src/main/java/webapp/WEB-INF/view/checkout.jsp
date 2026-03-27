<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Checkout</title>
</head>
<body>

    <h2>Checkout</h2>

    <!-- Order Summary -->
    <h3>Order Summary</h3>
    <table border="1">
        <tr>
            <th>Product</th>
            <th>Quantity</th>
            <th>Unit Price</th>
            <th>Subtotal</th>
        </tr>
        <c:forEach var="item" items="${cartItems}">
        <tr>
            <td>${item.product.title}</td>
            <td>${item.quantity}</td>
            <td>${item.product.price}</td>
            <td>${item.quantity * item.product.price}</td>
        </tr>
        </c:forEach>
        <tr>
            <td colspan="3"><strong>Total</strong></td>
            <td><strong>${total}</strong></td>
        </tr>
    </table>

    <!-- Checkout Form -->
    <form action="checkout" method="post">


        <!-- Payment Method -->
        <h3>Payment Method</h3>
        <input type="radio" name="paymentMethod" value="credit_card" id="credit_card">
        <label for="credit_card">Credit Card</label> <br/>

        <input type="radio" name="paymentMethod" value="vodafone_cash" id="vodafone_cash">
        <label for="vodafone_cash">Vodafone Cash</label> <br/>

        <input type="radio" name="paymentMethod" value="cash_on_delivery" id="cash_on_delivery">
        <label for="cash_on_delivery">Cash on Delivery</label> <br/><br/>

        <!-- Credit Card Fields -->
        <div id="creditCardFields" style="display:none">
            <h3>Card Information</h3>
            <label>Card Number:</label>
            <input type="text" name="cardNumber" placeholder="4242 4242 4242 4242" maxlength="16"/> <br/><br/>

            <label>Expiry Date:</label>
            <input type="text" name="expiry" placeholder="MM/YY"/> <br/><br/>

            <label>CVV:</label>
            <input type="text" name="cvv" placeholder="123" maxlength="3"/> <br/><br/>
        </div>

        <!-- Vodafone Cash Fields -->
        <div id="vodafoneCashFields" style="display:none">
            <h3>Vodafone Cash</h3>
            <label>Phone Number:</label>
            <input type="text" name="vodafoneNumber" placeholder="01012345678"/> <br/><br/>
        </div>

        <button type="submit">Place Order</button>

    </form>

    <!-- JS to show/hide payment fields -->
    <script>
        const radios = document.querySelectorAll('input[name="paymentMethod"]');
        const creditCardFields = document.getElementById('creditCardFields');
        const vodafoneCashFields = document.getElementById('vodafoneCashFields');

        radios.forEach(radio => {
            radio.addEventListener('change', function () {
                creditCardFields.style.display = 'none';
                vodafoneCashFields.style.display = 'none';

                if (this.value === 'credit_card') {
                    creditCardFields.style.display = 'block';
                } else if (this.value === 'vodafone_cash') {
                    vodafoneCashFields.style.display = 'block';
                }
            });
        });
    </script>

</body>
</html>
