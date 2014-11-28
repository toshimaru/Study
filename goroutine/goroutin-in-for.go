package main

import (
	"log"
	"sync"
	"time"
)

var wg sync.WaitGroup

func main() {
	for i := 1; i <= 10; i++ {
		wg.Add(1)
		go heavy_task(i)
	}
	wg.Wait()
}

func heavy_task(i int) {
	log.Println("start", i)
	for j := i; j <= 10; j++ {
		time.Sleep(time.Second)
	}
	log.Println("end", i)
	wg.Done()
}
