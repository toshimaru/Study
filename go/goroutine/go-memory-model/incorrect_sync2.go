package main

import (
	"sync"
	"time"
)

var a string
var done bool
var once sync.Once

func main() {
	twoprint()
	time.Sleep(1 * time.Second)
}

func setup() {
	a = "hello, world"
	done = true
}

func doprint() {
	if !done {
		once.Do(setup)
	}
	// time.Sleep(2 * time.Second) // ensure incorrect output
	print(a)
}

func twoprint() {
	go doprint()
	// time.Sleep(1 * time.Second) // ensure incorrect output
	go doprint()
}
