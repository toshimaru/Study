package main

import "fmt"

func main() {
	s := "abc"
	b := []byte(s)
	s2 := string(b)

	fmt.Println(s2)
}
