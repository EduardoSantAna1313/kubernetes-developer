FROM golang:1.17

WORKDIR /app

RUN go mod init main && \
    go get -u github.com/gorilla/mux

COPY . .

EXPOSE 8080

CMD ["go", "run", "main.go"]
