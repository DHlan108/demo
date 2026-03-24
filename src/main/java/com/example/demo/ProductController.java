package com.example.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/products")
@CrossOrigin("*") 
public class ProductController {

    @Autowired
    private ProductRepository productRepository;

    // Lấy danh sách tất cả sản phẩm 
    @GetMapping
    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }

    // Tìm kiếm sản phẩm theo Tên hoặc Phân loại
    @GetMapping("/search")
    public List<Product> searchProducts(@RequestParam String keyword) {
        return productRepository.findByNameContainingIgnoreCaseOrCategoryContainingIgnoreCase(keyword, keyword);
    }

    // Thêm hoặc Cập nhật sản phẩm
    @PostMapping
    public Product saveProduct(@RequestBody Product product) {
        return productRepository.save(product);
    }

    // Xóa sản phẩm 
    @DeleteMapping("/code/{productCode}")
    public void deleteProductByCode(@PathVariable String productCode) {
        productRepository.deleteByProductCode(productCode);
    }
    // Lấy chi tiết 1 sản phẩm theo ID (dùng cho nút Sửa)
    @GetMapping("/{id}")
    public Product getProductById(@PathVariable Long id) {
        return productRepository.findById(id).orElse(null);
    }
}