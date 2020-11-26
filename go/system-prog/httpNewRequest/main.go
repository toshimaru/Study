package main

import (
	"net/http"
	"os"
)

func main() {
	req, _ := http.NewRequest("GET", "http://ascii.jp", nil)
	req.Write(os.Stdout)
}
