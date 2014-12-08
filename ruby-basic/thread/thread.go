// ref. http://qiita.com/keisukeP/items/f4d680eb9e8f93263fa9
package main

import (
	"fmt"
	"io"
	"net/http"
	"os"
	"sync"
)

func main() {
	var wg sync.WaitGroup

	for i := 0; i < 100; i++ {
		wg.Add(1)
		var url string = "http://dummyimage.com/600x400"

		//ファイルを開く
		file, err := os.Create("images/" + fmt.Sprint(i) + ".png")
		if err != nil {
			panic(err)
		}

		go func() {
			response, err := http.Get(url)
			if err != nil {
				panic(err)
			}
			//レスポンスのボディを閉じる関数の遅延実行指定
			defer response.Body.Close()

			//fmt.Println("status:", response.Status)

			//ファイルを閉じる関数の遅延実行指定
			defer file.Close()

			//レスポンスのボディから読み込みつつファイルに書き出す。
			io.Copy(file, response.Body)
			wg.Done()
		}()
	}

	wg.Wait()
}

/*
Result1 (go run)
---
time go run thread.go
go run thread.go  0.43s user 0.15s system 45% cpu 1.273 total

Result2 (after go build)
---
time ./thread
./thread  0.04s user 0.08s system 15% cpu 0.769 total
*/
