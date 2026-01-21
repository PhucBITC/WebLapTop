# Stage 1: Build ứng dụng
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src ./src
RUN mvn clean package -DskipTests

# Stage 2: Chạy ứng dụng
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
# Sửa dòng dưới đây để copy file .war thay vì .jar
COPY --from=build /app/target/*.war app.war 
EXPOSE 8080
# Chạy file war như một ứng dụng bình thường
ENTRYPOINT ["java", "-jar", "app.war"]