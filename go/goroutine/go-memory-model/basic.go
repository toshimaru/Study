// https://golang.org/ref/mem
package main

import (
	"time"
)

var a string

func main() {
	a = "hello, world"
	go f()
	time.Sleep(1 * time.Second)
}

func f() {
	print(a)
}
