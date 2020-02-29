package main

import (
	"log"
	"sync"
)

func main() {
	var wg sync.WaitGroup
	wg.Add(1)
	go func() {
		log.Println("1")
		wg.Done()
	}()
	log.Println("2")
	wg.Wait()
}
