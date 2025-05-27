package vn.vietphuc.laptopshop.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import vn.vietphuc.laptopshop.domain.User;
import vn.vietphuc.laptopshop.domain.dto.RegisterDTO;
import vn.vietphuc.laptopshop.domain.Role;
import vn.vietphuc.laptopshop.repository.OrderRepository;
import vn.vietphuc.laptopshop.repository.ProductRepository;
import vn.vietphuc.laptopshop.repository.RoleRepository;
import vn.vietphuc.laptopshop.repository.UserRepository;

@Service

// Service này thì nó được gọi là Model
public class UserSevice {

    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final ProductRepository productRepository;
    private final OrderRepository orderRepository;

    public UserSevice(UserRepository userRepository, RoleRepository roleRepository,
            ProductRepository productRepository, OrderRepository orderRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.productRepository = productRepository;
        this.orderRepository = orderRepository;
    }

    public String handleHello() {
        return "Truyen data tu controll qua thang view";
    }

    public Page<User> getAllUser(Pageable page) {
        return this.userRepository.findAll(page);
    }

    public User getUserById(long id) {
        return this.userRepository.findById(id);
    }

    public List<User> getAllUserByEmail(String email) {
        return this.userRepository.findOneByEmail(email);
    }

    public User handlSaveUser(User user) {
        User phuc = this.userRepository.save(user);
        System.out.println(phuc);
        return phuc;
    }

    public void deleteAUser(long id) {
        this.userRepository.deleteById(id);
    }

    public Role getRoleByName(String name) {
        return this.roleRepository.findByName(name);
    }

    public User registerDTOtoUser(RegisterDTO registerDto) {
        User user = new User();
        user.setFullName(registerDto.getFirstName() + " " + registerDto.getLastName());
        user.setEmail(registerDto.getEmail());
        user.setPassword(registerDto.getPassWord());
        return user;
    }

    public boolean checkEmailExits(String email) {
        return this.userRepository.existsByEmail(email);
    }

    public User getUserByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }

    // Đếm số lượng count trong mỗi thành phần
    public long countUser() {
        return this.userRepository.count();
    }

    public long countProduct() {
        return this.productRepository.count();
    }

    public long countOrder() {
        return this.orderRepository.count();
    }

}

// Nếu data của bạn không duy nhất thì chúng ta không nền dùng findOne , chúng
// ta có thể dùng 2 cách sau : findFirstByEmail
// hoặc findTop1ByEmail để từ đó có thể lấy được 1 kết quả (giới hạn 1 kết quả
// trả về )