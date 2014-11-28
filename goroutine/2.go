package main

import "log"

func main() {
	channel := make(chan string)
	go func() {
		channel <- "1"
	}()
	log.Println(<-channel) // Blocking untill channel ends
	log.Println("2")
}

//Result:
// 2014/11/29 02:58:22 1
// 2014/11/29 02:58:22 2
