FROM eclipse-temurin:21-jdk AS builder

COPY . .

RUN ./mvnw package

FROM eclipse-temurin:21-jre

WORKDIR /app

COPY --from=builder ./target/demo-0.0.1-SNAPSHOT.jar demo-0.0.1-SNAPSHOT.jar

CMD ["java", "-jar", "demo-0.0.1-SNAPSHOT.jar"]

EXPOSE 8080
