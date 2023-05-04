package main

import (
	"fmt"
	"log"
	"net/http"
	"github.com/gorilla/mux"
)

func helloWorld(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello, World with GOOOOOOOOOO!")
}

func main() {
	fmt.Println("Starting rest api with go...")
	router := mux.NewRouter().StrictSlash(true)
	router.HandleFunc("/", helloWorld).Methods("GET")

	log.Fatal(http.ListenAndServe(":8080", router))
}
