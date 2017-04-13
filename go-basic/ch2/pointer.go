package main

import "fmt"

var z = f()

func f() *int {
	v := 1
	return &v
}

func incr(p *int) int {
	*p++
	return *p
}

func main() {
	x := 1
	p := &x         // p は intへのポインタ で x のアドレスを持っている
	fmt.Println(*p) // => 1
	*p = 2
	fmt.Println(x) // => 2

	fmt.Println(z) // => {pointer address}

	v := 1
	incr(&v)
	fmt.Println(incr(&v)) // => {pointer address}
}
