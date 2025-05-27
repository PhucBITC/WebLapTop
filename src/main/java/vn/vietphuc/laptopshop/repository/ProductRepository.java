package vn.vietphuc.laptopshop.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import vn.vietphuc.laptopshop.domain.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long>, JpaSpecificationExecutor<Product> {
    void deleteById(long id);

    Page<Product> findAll(Pageable page); // Nó sẽ được trả về danh sách sản phẩm

    Page<Product> findAll(Specification<Product> spec, Pageable page); // Nó sẽ được trả
                                                                       // về
                                                                       // danh sách sản
                                                                       // phẩm
    // Product save(Product phucxo);

    // List<Product> findAll();

    // Optional<Product> findById(long id);

}
