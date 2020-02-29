package main

import "fmt"

func main() {
	a := [...]int{1, 2, 3}
	fmt.Println(a)

	months := []string{"January", "February", "March", "November", "December"}
	fmt.Println(months)
	fmt.Println(len(months))
	fmt.Println(cap(months))
	fmt.Println(len(months[2:3]))
	fmt.Println(cap(months[2:3]))
	fmt.Println(months[:2])
	fmt.Println(months[2:])

	var x []int
	fmt.Println(x)
	fmt.Println(append(x, 1))
	fmt.Println(x)
	fmt.Println(append(x, 2))
	fmt.Println(x)
	fmt.Printf("%q", []rune("abcdef"))

	a := [...]int{"a", "b", "c"}
}

func noempty2(strings []string) []string {
	out := strings[:0]
	for _, s := range strings {
		if s != "" {
			out = append(out, s)
		}
	}
	return out
}
