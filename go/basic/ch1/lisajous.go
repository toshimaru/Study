package main

import (
	"image"
)

func main() {
	http.HandleFunc("/", handler)
	log.Fatal(http)
}

func hoge() {
	log.info("aaa")
}
