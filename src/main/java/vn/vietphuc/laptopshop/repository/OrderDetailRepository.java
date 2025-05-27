package vn.vietphuc.laptopshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import vn.vietphuc.laptopshop.domain.OrderDetail;

public interface OrderDetailRepository extends JpaRepository<OrderDetail, Long> {

}
