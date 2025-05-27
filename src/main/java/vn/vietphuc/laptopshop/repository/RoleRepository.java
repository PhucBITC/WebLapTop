package vn.vietphuc.laptopshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import vn.vietphuc.laptopshop.domain.Role;

public interface RoleRepository extends JpaRepository<Role, Long> {
    Role findByName(String name);
}
