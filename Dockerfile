# Use the official maven/Java 8 image to create a build artifact.
# https://hub.docker.com/_/maven
FROM maven:3.5-jdk-8-alpine as builder

# Copy local code to the container image.
WORKDIR /app
COPY pom.xml .
COPY src ./src

# Build a release artifact.
RUN mvn package -DskipTests


RUN cp /app/target/springboot-knative*.jar  /HelloSpring.jar
# Run the web service on container startup.
CMD ["java",  "-jar", "/HelloSpring.jar"]