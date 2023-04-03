const sleep = (sec: number) => new Promise((res) => setTimeout(res, sec * 1000));

async function hello() {
  await sleep(3);
  console.log("hello!");
}
async function hi() {
  await sleep(2);
  console.log("hi!");
}

console.log("=== before hello -> hi ===");
hello();
hi();
console.log("=== after hello -> hi ===");

