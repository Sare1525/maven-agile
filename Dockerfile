# Use a Java runtime
FROM openjdk:11-jre-slim
# Copy the jar file from the target folder to the container
COPY target/*.jar app.jar
# Expose the port
EXPOSE 8080
# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
