package main

import "encoding/json"
import "os"

func main() {
	encoder := json.NewEncoder(os.Stdout)
	encoder.SetIndent("", " ")
	encoder.Encode(map[string]string{
		"example": "encoding/json",
		"hello":   "world",
	})
}
