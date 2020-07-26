package main

import (
	"sync"
	"time"
)

var a string
var once sync.Once

func main() {
	twoprint()
	time.Sleep(1 * time.Second)
}

func setup() {
	a = "hello, world"
}

func doprint() {
	once.Do(setup)
	print(a)
}

func twoprint() {
	go doprint()
	go doprint()
}
