FROM maven:3.6.1-jdk-8-alpine AS MAVEN_BUILD
 
COPY complete .
 
RUN mvn clean package
 
FROM openjdk:8-jre-alpine3.9
 
COPY --from=MAVEN_BUILD /target/testing-web-0.0.1-SNAPSHOT.jar /spring-hello-world.jar
 
CMD ["java", "-jar", "/spring-hello-world.jar"]
