// ref. https://zenn.dev/estra/books/js-async-promise-chain-event-loop/viewer/14-epasync-chain-to-async-await
(async () => {
  console.log("😎 async 関数の処理を開始します");
  const url = "https://api.github.com/zen";

  // 非同期 API の作業を起点にした一連の作業
  const response = await fetch(url); // 作業 A (データの取得: 非同期 API による並列的作業)
  // A が終わってから B を行うので一時中断して関数の外へ
  const text = await response.text(); // 作業 B (データの抽出: 非同期 API による並列的作業)
  // B が終わってから C を行うので一時中断して関数の外へ
  const message = "🦄 Github says... " + text; // 作業 C (データの加工)

  console.log("👻 async 関数の処理を終了します");
  return message;
})().then((message) => console.log(message)); // 一連の作業結果として得られるテキストを出力

// 環境が fetch をやってくれている間もメインスレッドで別のこと(console.log の起動)ができる
console.log(
  "👉 作業 A を起動させて await で一時中断されたらグローバルコンテキストにあるこれが実行される"
);
