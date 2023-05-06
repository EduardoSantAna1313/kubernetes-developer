docker rm -f app-jdbc

docker run --name app-jdbc \
    -e POSTGRES_URL="jdbc:postgresql://localhost:30798/kubernetes" \
    -e POSTGRES_USER="postgres" \
    -e POSTGRES_PASSWORD="postgres066252" \
    -e TIMEOUT=2500 \
    app-jdbc:v1
