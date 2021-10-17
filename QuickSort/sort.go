package main

import (
	"fmt"
	"math/rand"
)

func main() {
	ary := make([]int, 100)
	for i := range ary {
		ary[i] = rand.Intn(1000)
	}
	fmt.Println(ary)
	fmt.Println(qsort(ary))
}

func qsort(ary []int) []int {
	if len(ary) == 0 {
		return ary
	}

	pivot := ary[0]
	ary = ary[1:]
	lesser, greater := lesserAndGreater(ary, pivot)
	return append(append(qsort(lesser), pivot), qsort(greater)...)
}

func lesserAndGreater(ary []int, pivot int) ([]int, []int) {
	var lesser, greater []int
	for i, v := range ary {
		if ary[i] > pivot {
			greater = append(greater, v)
		} else {
			lesser = append(lesser, v)
		}
	}
	return lesser, greater
}
