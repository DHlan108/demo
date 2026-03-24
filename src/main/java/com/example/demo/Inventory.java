package com.example.demo;

import jakarta.persistence.*;

@Entity
@Table(name = "inventory")
public class Inventory {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // Kết nối với bảng Product
    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;

    // Kết nối với bảng Store (Cửa hàng)
    @ManyToOne
    @JoinColumn(name = "store_id")
    private Store store;

    private int stockQuantity;

    public Inventory() {}

    // Getters và Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public Product getProduct() { return product; }
    public void setProduct(Product product) { this.product = product; }
    public Store getStore() { return store; }
    public void setStore(Store store) { this.store = store; }
    public int getStockQuantity() { return stockQuantity; }
    public void setStockQuantity(int stockQuantity) { this.stockQuantity = stockQuantity; }
}