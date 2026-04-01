package org.example.entity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Table(name = "cart")
@Entity
public class Cart {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private  int id;
    @OneToOne
    @JoinColumn(name = "user_id", unique = true)

    private  User user;
    @OneToMany(mappedBy = "cart")
    private List<cartItem> items=new ArrayList<>();

    public List<cartItem> getItems() {
        return items;
    }

    public void setItems(List<cartItem> items) {
        this.items = items;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
    public double getTotalPrice() {
        double total = 0;
        for (cartItem item : items) {
            total += item.getSubtotal();
        }
        return total;
    }
}
