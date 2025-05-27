package vn.vietphuc.laptopshop.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import vn.vietphuc.laptopshop.domain.Order;
import vn.vietphuc.laptopshop.domain.User;

public interface OrderRepository extends JpaRepository<Order, Long> {
    List<Order> findByUser(User user);

    Page<Order> findAll(Pageable page);
}
