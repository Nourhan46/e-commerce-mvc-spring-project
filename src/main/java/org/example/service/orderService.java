package org.example.service;

import org.example.entity.Payment;
import org.example.entity.User;

public interface orderService {
    public void checkout(User user, Payment payment);
}
