# 💻 LaptopShop - E-Commerce Platform

A premium, full-stack E-commerce web application built with **Java Spring Boot**, focused on providing a seamless shopping experience for laptops with a high-end, modern administrative dashboard.

## 🚀 Key Features

### 🛒 Client-Side
- **Advanced Product Filtering**: Multi-criteria search (brand, price ranges, categories) with optimized pagination.
- **Smart Shopping Cart**: Supports both guest and logged-in user carts with real-time quantity adjustments.
- **Order Management**: Comprehensive order history tracking with detailed status timestamps (Pending, Shipping, Completed).
- **Secure Authentication**: 
  - User registration with **Email Verification**.
  - "Forgot Password" workflow via email.
  - Role-based access control (RBAC).
- **Integrated Payments**: Support for **COD** and **VietQR (Dynamic QR Code)** for quick bank transfers.

### 🛡️ Admin Dashboard (The Nerve Center)
- **Dynamic Analytics**: Real-time revenue statistics and sales trends visualized through interactive charts.
- **Inventory Management**: Full CRUD operations for products with multi-image upload support.
- **Order Processing**: Streamlined order fulfillment workflow with automated status updates.
- **User Management**: Advanced account control and role assignment for system security.
- **Premium UI/UX**: Crafted with modern aesthetics (Glassmorphism, subtle animations, and consistent light/dark themes).

## 🛠️ Tech Stack
- **Backend**: Java 17, Spring Boot 3.x, Spring Security (Security & RBAC), Spring Data JPA.
- **Template Engine**: JSP, JSTL.
- **Database**: MySQL.
- **Frontend**: HTML5, Vanilla CSS3, JavaScript (ES6+), Bootstrap 5.
- **Integrations**: VietQR API, Mail Sender API.
- **Build Tools**: Maven.

## 🏗️ Project Architecture
The project follows the **MVC (Model-View-Controller)** pattern combined with **Layered Architecture** (Controller -> Service -> Repository -> Domain) to ensure clean code, scalability, and ease of maintenance.

## ⚙️ Installation & Setup
1. **Prerequisites**:
   - JDK 17 or higher
   - MySQL 8.0+
   - Maven 3.x

2. **Database Configuration**:
   Create a database named `laptopshop` and update `src/main/resources/application.properties`:
   ```properties
   spring.datasource.url=jdbc:mysql://localhost:3306/laptopshop
   spring.datasource.username=your_username
   spring.datasource.password=your_password
   ```

3. **Run the application**:
   ```bash
   mvn spring-boot:run
   ```
   Access the site at `http://localhost:8080`

## 👨‍💻 Author
**Phuc Viet (PhucXoIT)**
- **GitHub**: [@PhucXoIT](https://github.com/PhucXoIT)
- **LinkedIn**: [Your Profile Link]
- **Portfolio**: [Your Portfolio Link]

---
*Built with ❤️ for a better shopping experience.*
