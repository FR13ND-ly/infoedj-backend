# Use the official Maven image as the build environment
FROM maven:3.8.4-openjdk-17-slim AS build

# Set the working directory in the container
WORKDIR /app

# Copy the pom.xml and project files to the container
COPY pom.xml .
COPY src ./src

# Build the Spring Boot application
RUN mvn clean package -DskipTests

# Use the official AdoptOpenJDK 17 as the runtime environment
FROM adoptopenjdk:17-jre-hotspot

# Set the working directory in the container
WORKDIR /app

# Copy the built JAR file from the build environment to the container
COPY --from=build /app/target/*.jar app.jar

# Expose the port on which your Spring Boot application listens
EXPOSE 8080

# Set the entry point to run the Spring Boot application
ENTRYPOINT ["java", "-jar", "app.jar"]