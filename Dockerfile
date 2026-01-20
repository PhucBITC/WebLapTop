# Stage 1: Build ứng dụng
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
# Chỉ copy file pom.xml trước để tận dụng cache của Docker
COPY pom.xml .
RUN mvn dependency:go-offline

# Sau đó mới copy toàn bộ code và build
COPY src ./src
RUN mvn clean package -DskipTests

# Stage 2: Chạy ứng dụng
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]