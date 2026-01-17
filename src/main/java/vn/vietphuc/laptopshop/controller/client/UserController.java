package vn.vietphuc.laptopshop.controller.client;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import vn.vietphuc.laptopshop.domain.User;
import vn.vietphuc.laptopshop.service.UploadService;
import vn.vietphuc.laptopshop.service.UserSevice;

@Controller("clientUserController")
public class UserController {

    private final UserSevice userSevice;
    private final PasswordEncoder passwordEncoder;
    private final UploadService uploadService;

    public UserController(UserSevice userSevice, PasswordEncoder passwordEncoder, UploadService uploadService) {
        this.userSevice = userSevice;
        this.passwordEncoder = passwordEncoder;
        this.uploadService = uploadService;
    }

    @GetMapping("/user/profile")
    public String getProfilePage(Model model) {
        String email = this.userSevice.getCurrentUserEmail();
        if (email == null) {
            return "redirect:/login";
        }
        User currentUser = this.userSevice.getUserByEmail(email);
        model.addAttribute("user", currentUser);
        return "client/user/profile";
    }

    @PostMapping("/user/profile")
    public String handleUpdateProfile(@ModelAttribute("user") User user, @RequestParam("avatarFile") MultipartFile avatarFile,
            jakarta.servlet.http.HttpSession session) {
        String email = this.userSevice.getCurrentUserEmail();
        if (email == null) {
            return "redirect:/login";
        }
        User currentUser = this.userSevice.getUserByEmail(email);
        currentUser.setFullName(user.getFullName());
        currentUser.setAddress(user.getAddress());
        currentUser.setPhone(user.getPhone());

        if (!avatarFile.isEmpty()) {
            String avatar = this.uploadService.handleSaveUploadFile(avatarFile, "avatar");
            currentUser.setAvatar(avatar);
        }

        this.userSevice.handlSaveUser(currentUser);
        session.setAttribute("fullName", currentUser.getFullName());
        session.setAttribute("avatar", currentUser.getAvatar());
        return "redirect:/user/profile";
    }

    @PostMapping("/user/change-password")
    public String handleChangePassword(
            @RequestParam("oldPassword") String oldPassword,
            @RequestParam("newPassword") String newPassword,
            @RequestParam("confirmPassword") String confirmPassword) {
        String email = this.userSevice.getCurrentUserEmail();
        if (email == null) {
            return "redirect:/login";
        }
        User currentUser = this.userSevice.getUserByEmail(email);

        if (!this.passwordEncoder.matches(oldPassword, currentUser.getPassword())) {
            return "redirect:/user/profile?error=password";
        }

        if (!newPassword.equals(confirmPassword)) {
            return "redirect:/user/profile?error=confirm";
        }

        currentUser.setPassword(this.passwordEncoder.encode(newPassword));
        this.userSevice.handlSaveUser(currentUser);

        return "redirect:/user/profile?success_password";
    }
}
