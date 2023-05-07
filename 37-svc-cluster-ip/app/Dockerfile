FROM maven:3-openjdk-11-slim

COPY . /app

WORKDIR /app

# download the psql driver
RUN mkdir libs && curl -o libs/postgresql-42.6.0.jar https://repo1.maven.org/maven2/org/postgresql/postgresql/42.6.0/postgresql-42.6.0.jar

# building...
RUN javac --release 11 \ 
    --source-path ./src/ \
    -cp ./libs/postgresql-42.6.0.jar \
    -d output \
    src/psql/App.java

CMD java -Dfile.encoding=UTF-8 -cp ./libs/postgresql-42.6.0.jar:./output --limit-modules java.management.rmi,java.sql --add-modules ALL-MODULE-PATH psql.App

