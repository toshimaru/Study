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
		panic("xx error!")
	}

	db, err := leveldb.OpenFile("/Users/toshimaru/Downloads/bid_condition/idfa_bid_condition/bid_condition", nil)
	if err != nil {
		panic("1 error!")
	}
	b, err := db.Get([]byte("idfa_targeting:15169"), nil)
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
