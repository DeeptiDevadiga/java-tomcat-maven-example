# FROM eclipse-temurin:17-jdk-alpine
# WORKDIR /app
# COPY target/app.jar app.jar
# EXPOSE 8081
# CMD ["java", "-jar", "app.jar"]


# Stage 1: Build the JAR
FROM eclipse-temurin:17-jdk as build

WORKDIR /app

COPY . .

RUN ./mvnw clean package -DskipTests

# Stage 2: Run the JAR
FROM eclipse-temurin:17-jre

WORKDIR /app

COPY --from=build /app/target/*.jar app.jar

EXPOSE 8081

ENTRYPOINT ["java", "-jar", "app.jar"]
