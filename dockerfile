# Use OpenJDK 17 base image (lightweight Alpine)
FROM openjdk:17-jdk-alpine

# Set working directory inside the container
WORKDIR /app

# Copy the built JAR file from target directory
COPY target/*.jar app.jar

# Expose the port your application runs on
EXPOSE 8080

# Command to run the JAR
ENTRYPOINT ["java", "-jar", "app.jar"]

