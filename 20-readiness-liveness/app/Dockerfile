FROM maven:3-openjdk-11-slim as builder

COPY simplewebapp /app

WORKDIR /app

RUN mvn package -DskipTests

FROM amazoncorretto:11

COPY --from=builder /app/target/simple-webapp-0.0.1-SNAPSHOT.jar /app.jar

CMD java -jar /app.jar