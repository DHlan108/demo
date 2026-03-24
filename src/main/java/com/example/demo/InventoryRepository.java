package com.example.demo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import java.util.List;

public interface InventoryRepository extends JpaRepository<Inventory, Long> {
    
    @Query("SELECT i.product.name AS productName, i.store.name AS storeName, i.stockQuantity AS stockQuantity " +
           "FROM Inventory i")
    List<InventoryReport> getInventoryReport();
}