docker run --name psql-custom \
    -p 5432:5432 \
    -e POSTGRES_USER="postgres" \
    -e POSTGRES_PASSWORD="postgres066252" \
    -e POSTGRES_DB="kubernetes" \
    psql-custom:v1
