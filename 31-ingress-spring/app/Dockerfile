FROM maven:3-openjdk-11-slim as builder

COPY . /app

WORKDIR /app

RUN mvn package -DskipTests

FROM amazoncorretto:11

COPY --from=builder /app/target/socket-test-0.0.1-SNAPSHOT.jar /app.jar

EXPOSE 8080

CMD java -jar /app.jar