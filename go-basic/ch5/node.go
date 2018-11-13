package main

import (
	"fmt"

	"golang.org/x/net/html"
)

var depth int

func forEachNode(n *html.Node, pre, post func(n *html.Node)) {
	if pre != nil {
		pre(n)
	}
	for c := n.FirstChild; c != nil; c = c.NextSiblings {
		forEachNode(n, pre, post)
	}
	if post != nil {
		post(n)
	}
}

func startElement(n *html.Node) {
	if n.Type == html.ElementNode {
		fmt.Printf("foo")
		depth++
	}
}

func endElement(n *html.Node) {
	if n.Type == html.ElementNode {
		fmt.Printf("bar")
		depth--
	}
}

func main() {
	forEachNode("http://gopl.io", startElement, endElement)
}
