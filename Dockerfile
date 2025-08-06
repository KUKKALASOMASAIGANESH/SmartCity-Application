# Use an OpenJDK base image
FROM eclipse-temurin:17-jdk-jammy

# Set working directory
WORKDIR /app

# Copy Maven wrapper and pom.xml
COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .

RUN chmod +x mvnw

# Download dependencies
RUN ./mvnw dependency:go-offline

# Copy the rest of the source code
COPY src ./src

# Build the application
RUN ./mvnw clean package -DskipTests

# Expose the port your app runs on
EXPOSE 8080

# Run the jar file
CMD ["java", "-jar", "target/*.jar"]
