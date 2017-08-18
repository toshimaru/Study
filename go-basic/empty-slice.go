package main

import (
	"fmt"
)

func main() {
	x := []int{}
	var y []int

	fmt.Println(x == nil)
	fmt.Println(y == nil)

	fmt.Println(len(x))
	fmt.Println(len(y))
	fmt.Println(len(y) == len(y))
}
