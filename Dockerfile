FROM eclipse-temurin:21-jdk

# Tạo biến môi trường cho file JAR
ARG JAR_FILE=target/demo2-0.0.1-SNAPSHOT.jar

# Tạo user an toàn để chạy ứng dụng
RUN addgroup --system spring && adduser --system --ingroup spring spring
USER spring:spring

# Sao chép file JAR vào container
COPY ${JAR_FILE} /app/demo2.jar

# Chạy ứng dụng Spring Boot
ENTRYPOINT ["java", "-jar", "/app/demo2.jar"]
