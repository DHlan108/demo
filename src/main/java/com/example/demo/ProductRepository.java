package com.example.demo;

import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;
public interface ProductRepository extends JpaRepository<Product, Long> {
    // Tự động tạo hàm tìm kiếm theo tên có chứa từ khóa (không phân biệt hoa thường)
    List<Product> findByNameContainingIgnoreCaseOrCategoryContainingIgnoreCase(String name, String category);
    @Transactional
    void deleteByProductCode(String productCode);
}
