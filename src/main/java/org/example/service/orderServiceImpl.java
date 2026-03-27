package org.example.service;

import org.example.dao.OrderDAO;
import org.example.dao.PaymentDAO;
import org.example.dao.UserDAO;
import org.example.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class orderServiceImpl  implements  orderService{
    @Autowired
    PaymentDAO paymentDAO;
    @Autowired
    CartItemService cartItemService;
    @Autowired
    OrderDAO orderDAO;
    @Autowired
    UserDAO userDAO;
    @Override
    public Order checkout(int user_id, Payment payment) {
        System.out.println("are in checkout fun");
            User current_user = userDAO.findById(user_id);
            List<cartItem> items= current_user.getCart().getItems();
        Order order = new Order();
payment.setOrder(order);

        order.setUser(current_user);
        order.setOrderDate(new Date());
        List<OrderItem> orderItems= new ArrayList<>();
        int total=0;
        for( cartItem item : items)
        {
            Product product= item.getProduct();
              if(item.getProduct().isIs_active())
              {
                  OrderItem orderItem= new OrderItem();
                  orderItem.setProduct(product);
                  orderItem.setQuantity(item.getQuantity());
                  orderItem.setUnitPrice(product.getPrice());
                  orderItem.setSubtotal(orderItem.getUnitPrice()*orderItem.getQuantity());
                  total+=orderItem.getUnitPrice()*orderItem.getQuantity();
                  orderItem.setOrder(order);

                  orderItems.add(orderItem);

              }

            System.out.println(item.getProduct().getTitle());
        }
        payment.setAmount(total);
        order.setOrderItems(orderItems);
        order.setTotalPrice((double) total);
        payment.setPaymentStatus("completed");
        cartItemService.deleteItems(items);
        orderDAO.saveOrder(order);
        paymentDAO.save(payment);

return  order;
    }
}
