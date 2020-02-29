package main

import "log"

func main() {
	go func() {
		log.Println("1")
	}()
	log.Println("2")
}

//Result
//```
//go run 1.go
//2014/11/29 02:54:19 2
//```
// => outputs only 2!
