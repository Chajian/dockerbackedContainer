# Use a base image with Java 11
FROM openjdk:11-jdk
ENV KAFKA_HOST=kafka
ENV MYSQL_HOST=mysql

LABEL maintainer="dockerbaked-app"
LABEL version=1.0
EXPOSE 8888

# Set the working directory
WORKDIR /app

# Download the JAR file
COPY ./dockerbacked-0.0.1-SNAPSHOT.jar /app/app.jar

# Define the command to run your Spring Boot application
#CMD ["java", "-jar", "app.jar"]
ENTRYPOINT java -jar app.jar --docker-cloud.kafkaIp=${KAFKA_HOST} --server.mysql=${MYSQL_HOST}