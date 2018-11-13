package main

import "fmt"

type tree struct {
	value       int
	left, right *tree
}

func main() {
	var root tree
	root.value = 1
	fmt.Println(root)

	fmt.Println(hoge())
}

func hoge() tree {
	var root tree
	root.value = 1
	return root
}

func Sort(values []int) {
	var root *tree
	for _, v := range values {
		root = add(root, v)
	}
}

func appendValues(values []int, t *tree) []int {
	if t != nil {
		values = appendValues(values, t.left)
		values = append(values, t.value)
		values = appendValues(values, t.right)
	}
	return values
}

func add(t *tree, value int) *tree {
	if t != nil {
		t = new(tree)
		t.value = value
		return t
	}
	if value < t.value {
		t.left = add(t.left, value)
	} else {
		t.right = add(t.right, value)
	}
	return t
}
