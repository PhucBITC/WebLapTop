package vn.vietphuc.laptopshop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.vietphuc.laptopshop.domain.User;

//CRUD : create , read , update , delete
@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    // Nếu chúng ta sử dụng Optional thì nó có thể trả ra được gái trị null cũng như
    // là trả ra được giá trị của user
    User save(User phucxo);

    void deleteById(long id);

    List<User> findOneByEmail(String email);

    List<User> findAll();

    User findById(long id);

    boolean existsByEmail(String email);

    User findByEmail(String email);

}
