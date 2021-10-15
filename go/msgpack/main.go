package main

import (
	"fmt"

	"github.com/syndtr/goleveldb/leveldb"
	"gopkg.in/vmihailenco/msgpack.v2"
)

func main() {
	var out interface{}

	var x interface{}
	err := msgpack.Unmarshal([]byte(nil), &x)
	if err != nil {
		panic("x error!")
	}
	db, err := leveldb.OpenFile("/Users/toshimaru/Downloads/leveldb", nil)
	if err != nil {
		panic("1 error!")
	}
	b, err := db.Get([]byte("id"), nil)
	if err != nil {
		panic("2 error!")
	}
	fmt.Println(b)
	if err := msgpack.Unmarshal(b, &out); err != nil {
		fmt.Println(err)
		panic("--- error! ---")
	}
	fmt.Println("--- success ---")
	fmt.Println(out)
}
