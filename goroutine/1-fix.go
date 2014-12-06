package main

import (
	"log"
	"sync"
)

func main() {
	var wg sync.WaitGroup
	go func() {
		wg.Add(1)
		log.Println("1")
		wg.Done()
	}()
	log.Println("2")
	wg.Wait()
}
