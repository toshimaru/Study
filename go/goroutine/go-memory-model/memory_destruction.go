package main

import "time"

var a string

func main() {
	hello()
	time.Sleep(1 * time.Second)
}

func hello() {
	go func() { a = "hello" }()
	print(a)
}
