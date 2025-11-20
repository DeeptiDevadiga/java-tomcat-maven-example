# FROM eclipse-temurin:17-jdk-alpine
# WORKDIR /app
# COPY target/app.jar app.jar
# EXPOSE 8081
# CMD ["java", "-jar", "app.jar"]


# Stage 1: Build the JAR
# FROM maven:3.9-eclipse-temurin-17 AS build
# WORKDIR /app
# COPY . .
# RUN mvn clean package -DskipTests

# # Stage 2: Run the JAR
# FROM eclipse-temurin:17-jre
# WORKDIR /app
# COPY --from=build /app/target/*.jar app.jar
# EXPOSE 8081
# ENTRYPOINT ["java", "-jar", "app.jar"]


FROM tomcat:9.0-jdk17-temurin

# Optional: Remove default ROOT app so your app becomes the main one
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR from target folder into Tomcat
COPY target/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
