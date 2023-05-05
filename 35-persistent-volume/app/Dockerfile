FROM golang:1.17

WORKDIR /app

RUN go mod init main && \
    go get -u github.com/gorilla/mux && \
    mkdir /log/

COPY . .

RUN go build -o main .

CMD ["/app/main"]