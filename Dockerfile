# Use Java 17 runtime
FROM openjdk:17-jdk-slim

# Set working directory
WORKDIR /app

# Copy the jar built by Maven
COPY target/Jenkins_Project-1.0-SNAPSHOT.jar app.jar

# Run the jar
CMD ["java", "-jar", "app.jar"]

