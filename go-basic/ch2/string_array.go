package main

import "fmt"

func main() {
	modals := []string{"gold", "silver", "bronze"}
	fmt.Println(modals[0])
	fmt.Println(modals[1])
	fmt.Println(modals[2])
	// fmt.Println(modals[3]) // => panic: runtime error: index out of range
}
