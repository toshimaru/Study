package main

import (
	"fmt"
)

func main() {
	binaries := []int{
		0b01001000, 0b01100101, 0b01101100,
		0b01101100, 0b01101111, 0b00100000,
		0b01010100, 0b01100101, 0b01100001,
		0b01101101, 0b01010000, 0b01101001,
		0b01111000, 0b01100101, 0b01101100,
	}

	var result string
	for _, binary := range binaries {
		result += string(rune(binary))
	}
	fmt.Println(result)
}

