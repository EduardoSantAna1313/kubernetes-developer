package main

import (
    "log"
    "os"
    "time"
)

func main() {
    file, err := os.OpenFile("/log/app.log", os.O_CREATE|os.O_APPEND|os.O_WRONLY, 0644)
    if err != nil {
        log.Fatal(err)
    }
    defer file.Close()

    log.SetOutput(file)

    ticker := time.NewTicker(10 * time.Second)
    defer ticker.Stop()

    for {
        select {
        case <-ticker.C:
            log.Println("hello world")
        }
    }
}
