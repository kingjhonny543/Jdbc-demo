# Use a base image that has Java installed
FROM openjdk:21-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file from the target directory to the container
COPY target/myproject-1.0.jar app.jar

# Optionally, copy the MySQL Connector JAR if not included in the main JAR
COPY ~/.m2/repository/mysql/mysql-connector-j/8.0.33/mysql-connector-j-8.0.33.jar mysql-connector.jar

# Set environment variables for database connection (optional)
ENV DB_URL=jdbc:mysql://localhost:3306/mydb
ENV DB_USER=root
ENV DB_PASS=

# Command to run the JAR file
ENTRYPOINT ["java", "-jar", "app.jar"]
