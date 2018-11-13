package main

import "fmt"

func main() {
	ages := map[string]int{
		"alice": 31,
	}
	age, ok := ages["alice"]

	fmt.Println(age)
	fmt.Println(ok)

	age2, ok2 := ages["hoge"]
	fmt.Println(age2)
	fmt.Println(ok2)
}
