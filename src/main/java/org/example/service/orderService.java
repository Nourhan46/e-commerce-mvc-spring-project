package org.example.service;

import org.example.entity.Order;
import org.example.entity.Payment;
import org.example.entity.User;

public interface orderService {
    public Order checkout(int user_id, Payment payment);
}
