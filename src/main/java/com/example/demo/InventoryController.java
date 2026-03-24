package com.example.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/inventory")
@CrossOrigin("*")
public class InventoryController {

    @Autowired
    private InventoryRepository inventoryRepository;

    @Autowired
    private ProductRepository productRepository; // 

    @Autowired
    private StoreRepository storeRepository;     

    // API lấy báo cáo (đã có từ trước)
    @GetMapping("/report")
    public List<InventoryReport> getReport() {
        return inventoryRepository.getInventoryReport();
    }

    // API NHẬP KHO MỚI
    @PostMapping("/add")
    public ResponseEntity<?> addInventory(@RequestBody InventoryRequest request) {
        // Tìm Sản phẩm và Cửa hàng từ Database
        Product product = productRepository.findById(request.getProductId()).orElse(null);
        Store store = storeRepository.findById(request.getStoreId()).orElse(null);

        if (product == null || store == null) {
            return ResponseEntity.badRequest().body("Sản phẩm hoặc Cửa hàng không tồn tại!");
        }

        // Tạo bản ghi Tồn kho mới và Lưu
        Inventory inventory = new Inventory();
        inventory.setProduct(product);
        inventory.setStore(store);
        inventory.setStockQuantity(request.getStockQuantity());
        
        inventoryRepository.save(inventory);
        return ResponseEntity.ok("Nhập kho thành công!");
    }
}