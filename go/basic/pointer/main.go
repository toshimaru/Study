package main

import "fmt"

func main() {
	var n int = 10
	var m int = 20
	var p *int = &n
	var q *int = &m
	fmt.Println(n)
	fmt.Println(*p)
	*p = 100
	fmt.Println(n)
	fmt.Println(*p)

	fmt.Println(p)
	fmt.Println(q)
	fmt.Println(p == q)
	fmt.Println(p != q)
}
