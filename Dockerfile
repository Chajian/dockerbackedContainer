# Use a base image with Java 11
FROM openjdk:11


LABEL maintainer="dockerbaked-app"
LABEL version=1.0
EXPOSE 8888

# Set the working directory
WORKDIR /app

# Download the JAR file
RUN apt-get update && apt-get install -y curl
RUN curl -L -o app.jar https://github.com/Chajian/dockerbaked/releases/download/0.0.1/dockerbacked-0.0.1-SNAPSHOT.jar

# Define the command to run your Spring Boot application
CMD ["java", "-jar", "app.jar"]
