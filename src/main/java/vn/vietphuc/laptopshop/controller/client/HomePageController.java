package vn.vietphuc.laptopshop.controller.client;

import java.net.http.HttpRequest;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import vn.vietphuc.laptopshop.domain.Order;
import vn.vietphuc.laptopshop.domain.Product;
import vn.vietphuc.laptopshop.domain.User;
import vn.vietphuc.laptopshop.domain.dto.RegisterDTO;
import vn.vietphuc.laptopshop.service.OrderService;
import vn.vietphuc.laptopshop.service.ProductService;
import vn.vietphuc.laptopshop.service.UserSevice;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class HomePageController {
    private final ProductService productService;
    private final UserSevice userSevice;
    private final PasswordEncoder passwordEncoder;
    private final OrderService orderService;

    public HomePageController(ProductService productService, UserSevice userSevice, PasswordEncoder passwordEncoder,
            OrderService orderService) {
        this.productService = productService;
        this.userSevice = userSevice;
        this.passwordEncoder = passwordEncoder;
        this.orderService = orderService;
    }

    @GetMapping("/")
    public String getHomePage(Model model) {
        // List<Product> product = this.productService.fetchProducts();
        Pageable pageable = PageRequest.of(0, 10);
        Page<Product> prs = this.productService.fetchProducts(pageable);
        List<Product> product = prs.getContent();
        model.addAttribute("products", product);
        return "client/homepage/show";
    }

    @GetMapping("/register")
    public String getRegisterPage(Model model) {

        model.addAttribute("registerUser", new RegisterDTO());
        return "client/auth/register";
    }

    @PostMapping("/register")
    public String handleRegister(@ModelAttribute("registerUser") @Valid RegisterDTO registerDTO,
            BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "client/auth/register";
        }
        User user = this.userSevice.registerDTOtoUser(registerDTO);
        String hashPassword = this.passwordEncoder.encode(user.getPassword());

        user.setPassword(hashPassword);
        user.setRole(this.userSevice.getRoleByName("USER"));
        this.userSevice.handlSaveUser(user);
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String getLoginPage(Model model) {
        return "client/auth/login";
    }

    @GetMapping("/access-deny")
    public String getDenyPage(Model model) {
        return "client/auth/deny";
    }

    @GetMapping("/order-history")
    public String getOrderHistoryPage(Model model, HttpServletRequest request) {
        User cureenUser = new User();
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        cureenUser.setId(id);

        List<Order> order = this.orderService.fetchOrderByUser(cureenUser);
        model.addAttribute("orders", order);
        return "client/cart/order-history";
    }

}
