package main

import "fmt"

type rect struct {
	width, height float64
}

func (r rect) area() float64 {
	return r.width * r.height
}
func (r rect) perim() float64 {
	return 2*r.width + 2*r.height
}

func main() {
	r := rect{width: 3, height: 4}
	fmt.Println(r.area())
	fmt.Println(r.perim())
}
