mvn clean package

docker build -t java-tuning:v1 .

docker run -d --name java-tuning -p 8888:8888 java-tuning:v1
