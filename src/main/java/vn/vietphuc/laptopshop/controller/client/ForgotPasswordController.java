package vn.vietphuc.laptopshop.controller.client;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value; // Thêm dòng này
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import vn.vietphuc.laptopshop.domain.User;
import vn.vietphuc.laptopshop.service.EmailService;
import vn.vietphuc.laptopshop.service.UserSevice;

import java.util.UUID;

@Controller
public class ForgotPasswordController {

    private final UserSevice userService;
    private final PasswordEncoder passwordEncoder;
    private final EmailService emailService;

    // Tự động lấy giá trị từ application.properties hoặc biến môi trường
    @Value("${app.base.url}")
    private String baseUrl;

    @Autowired
    public ForgotPasswordController(UserSevice userService, PasswordEncoder passwordEncoder,
            EmailService emailService) {
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
        this.emailService = emailService;
    }

    @GetMapping("/forgot-password")
    public String showForgotPasswordForm() {
        return "client/auth/forgot-password";
    }

    @PostMapping("/forgot-password")
    public String processForgotPassword(@RequestParam("email") String email, Model model) {
        User user = userService.getUserByEmail(email);
        if (user != null) {
            String token = UUID.randomUUID().toString();
            user.setResetPasswordToken(token);
            userService.handlSaveUser(user);

            // SỬA TẠI ĐÂY: Dùng biến baseUrl thay vì localhost cứng
            String resetLink = baseUrl + "/reset-password?token=" + token;

            try {
                this.emailService.sendSimpleEmail(user.getEmail(), "Đặt lại mật khẩu",
                        "Click vào đây để đặt lại mật khẩu: " + resetLink);
                model.addAttribute("message", "Link đặt lại mật khẩu đã được gửi vào email của bạn.");
            } catch (Exception e) {
                model.addAttribute("error", "Lỗi khi gửi email: " + e.getMessage());
            }
        } else {
            model.addAttribute("error", "Không tìm thấy tài khoản với email này.");
        }
        return "client/auth/forgot-password";
    }

    // ... (Các phương thức reset-password giữ nguyên như cũ của bạn) ...
    @GetMapping("/reset-password")
    public String showResetPasswordForm(@RequestParam("token") String token, Model model) {
        User user = userService.getUserByResetPasswordToken(token);
        if (user == null) {
            model.addAttribute("error", "Token không hợp lệ hoặc đã hết hạn.");
            return "client/auth/forgot-password";
        }
        model.addAttribute("token", token);
        return "client/auth/reset-password";
    }

    @PostMapping("/reset-password")
    public String processResetPassword(@RequestParam("token") String token,
            @RequestParam("password") String password, Model model) {
        User user = userService.getUserByResetPasswordToken(token);
        if (user == null) {
            return "redirect:/forgot-password?error";
        }
        user.setPassword(passwordEncoder.encode(password));
        user.setResetPasswordToken(null); 
        userService.handlSaveUser(user);
        return "redirect:/login?resetSuccess";
    }
}