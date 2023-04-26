FROM maven:3-openjdk-11-slim

COPY RandomBackoffLimitError.java .

RUN javac RandomBackoffLimitError.java

CMD ["java", "RandomBackoffLimitError"]