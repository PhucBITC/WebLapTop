package vn.vietphuc.laptopshop.domain;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import vn.vietphuc.laptopshop.service.validator.StrongPassword;

//Cái này gọi là model 

//Tạo thực thể tử class thành bảng trong database jdbc
@Entity
@Table(name = "users") // Khi mà chúng ta sử dụng anotation table này thì
// lập tức trong database của chúng ta lại sản sinh 1 table thêm và có tên là
// người dùng cũng y chang như user luôn
public class User {

    // Để biến một thuộc tính thành 1 cái trường bên trong db , thì nó là ID của
    // chúng ta , thì chúng ta sử dụng anotation ID , mà nếu nó viết bên trên thuộc
    // tính nào thì nó chỉ áp dụng cho thuộc tính đầu tiên mà thôi
    @Id
    // Bình thường thì để mà có thể làm ID tăng tự động hoặc có thể gọi là
    // autoIncreament thì chúng ta sẽ thêm câu lệnh như sau (IDENTITY)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @NotNull
    @Email
    @Email(message = "Email không hợp lệ ", regexp = "^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$")
    private String email;

    @NotNull
    @Size(min = 2, message = "Password phải có tối thiểu 2 kí tự ")
    // @StrongPassword(message = "Password phải có 8 kí tự ")
    private String password;

    @NotNull
    @Size(min = 3, message = "FullName phải có tối thiểu 3 kí tự ")
    private String fullName;

    private String address;
    private String phone;

    private String avatar;

    // role id
    // user many --> to one --> role

    // Sử dụng joinColumns cho owner side
    // OneToMany

    @ManyToOne
    @JoinColumn(name = "role_id")
    private Role role;

    // user
    @OneToMany(mappedBy = "user")
    private List<Order> order;

    @OneToOne(mappedBy = "user")
    private Cart cart;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public List<Order> getOrder() {
        return order;
    }

    public void setOrder(List<Order> order) {
        this.order = order;
    }

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    @Override
    public String toString() {
        return "User [id=" + id + ", email=" + email + ", password=" + password + ", fullName=" + fullName
                + ", address=" + address + ", phone=" + phone + ", avatar=" + avatar + ", role=" + role + ", order="
                + order + ", cart=" + cart + "]";
    }

}