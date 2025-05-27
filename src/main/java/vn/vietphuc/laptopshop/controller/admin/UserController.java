package vn.vietphuc.laptopshop.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import vn.vietphuc.laptopshop.domain.User;
import vn.vietphuc.laptopshop.service.UploadService;
import vn.vietphuc.laptopshop.service.UserSevice;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;

// Thang ni quan trong nhat 
// @RestController nếu mà bạn muốn return chữ ở trong phương thức ra luôn thì phải sử dụng Restcontroller kèm với anotiation Getmapping 
@Controller
public class UserController {

    private final UserSevice userSevice;
    private final UploadService uploadService;
    private final PasswordEncoder passwordEncoder;

    public UserController(UserSevice userSevice, UploadService uploadSevice,
            PasswordEncoder passwordEncoder) {
        this.userSevice = userSevice;
        this.uploadService = uploadSevice;
        this.passwordEncoder = passwordEncoder;

    }

    @RequestMapping("/admin/user") // Những cái này đồng nghĩa với việc nó chính là method GET
    public String getViewUser(Model model,
            @RequestParam("page") Optional<String> pageOptional) {
        int page = 1;
        try {
            if (pageOptional.isPresent()) {
                // Convert String to int
                page = Integer.parseInt(pageOptional.get());
            } else {
                // page = 1 ;
            }

        } catch (Exception e) {
            // TODO: handle exception
        }

        Pageable pageable = PageRequest.of(page - 1, 1);
        Page<User> usersPage = this.userSevice.getAllUser(pageable);
        List<User> users = usersPage.getContent();
        model.addAttribute("user1", users);
        model.addAttribute("currentUser", page);
        model.addAttribute("totalUser", usersPage.getTotalPages());
        return "admin/user/show";
    }

    @RequestMapping("/admin/user/{id}") // sử dụng kĩ thuật anotation , pathVariable
    public String getUserDetailPage(Model model, @PathVariable long id) {
        System.out.println("check path id = " + id);
        User user = this.userSevice.getUserById(id);
        model.addAttribute("user", user);
        model.addAttribute("showID", id);
        return "admin/user/detail";
    }

    @GetMapping("/admin/user/create") // Nh?ng c?i n?y ??ng ngh?a v?i vi?c n? ch?nh l? method GET
    public String getAdminUser(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @PostMapping("/admin/user/create")
    public String createUserPage(Model model,
            @ModelAttribute("newUser") @Valid User phucxo,
            BindingResult newUserBindingResult,
            @RequestParam("phucvietFile") MultipartFile file) {

        // Validate
        // List<FieldError> errors = newUserBindingResult.getFieldErrors();
        // for (FieldError error : errors) {
        // System.out.println(error.getField() + " - " + error.getDefaultMessage());
        // }

        if (newUserBindingResult.hasErrors()) {
            return "admin/user/create";
        }

        String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
        String hashPassword = this.passwordEncoder.encode(phucxo.getPassword());
        phucxo.setAvatar(avatar);
        phucxo.setPassword(hashPassword);
        phucxo.setRole(this.userSevice.getRoleByName(phucxo.getRole().getName()));
        this.userSevice.handlSaveUser(phucxo);
        return "redirect:/admin/user";
    }

    @RequestMapping("/admin/user/update/{id}") // phương thức GET
    public String getUpdateUser(Model model, @PathVariable long id) {
        User currentUser = this.userSevice.getUserById(id);
        model.addAttribute("newUser", currentUser);
        return "admin/user/update";
    }

    // Khi người dùng nhin vào update thì nó sẽ được trả về tại nơi table-user
    // @RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)
    // hiện tại thì bạn sử dụng cái này hay sử dụng @PostMapping vẫn được , nhưng
    // dùng reqestmaping ok hơn nhiều
    @PostMapping("/admin/user/update")
    public String postUpdateUser(Model model, @ModelAttribute("newUser") User phucxo) {
        User cureentUser = this.userSevice.getUserById(phucxo.getId());

        if (cureentUser != null) {
            cureentUser.setAddress(phucxo.getAddress());
            cureentUser.setFullName(phucxo.getFullName());
            cureentUser.setPhone(phucxo.getPhone());
            cureentUser.setRole(this.userSevice.getRoleByName(phucxo.getRole().getName()));
            this.userSevice.handlSaveUser(cureentUser); // Hàm này là hàm để có thể lưu xuống database
        }
        return "redirect:/admin/user";
    }

    @RequestMapping("/admin/user/delete/{id}")
    // sử dụng kĩ thuật anotation , pathVariable
    public String getDeleteUser(Model model, @PathVariable long id) {
        User user = new User();
        user.setId(id);
        model.addAttribute("newUser", user);
        model.addAttribute("deleteUser", id);
        return "admin/user/delete";
    }

    @PostMapping("/admin/user/delete")
    // sử dụng kĩ thuật anotation , pathVariable
    public String postDeleteUser(Model model, @ModelAttribute("newUser") User phucxo) {
        this.userSevice.deleteAUser(phucxo.getId());
        return "redirect:/admin/user";
    }

    @GetMapping("/phucxo")
    public String getPhucXo() {
        return "Xin chao phuc xo";
    }

}

// //đây là cách viết theo cách DI : Dypendices
// @RestController
// public class UserController {

// private UserSevice userSevice;

// public UserController(UserSevice userSevice) {
// this.userSevice = userSevice;
// }

// @GetMapping("")
// public String getHomePage() {
// return this.userSevice.handleHello();
// }

// }