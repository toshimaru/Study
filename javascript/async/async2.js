const sleep = (sec) => new Promise((res) => setTimeout(res, sec * 1000));

class Foo {
  async bar() {
    await this.hello();
    this.hi();
  }
  async hello() {
    await sleep(3);
    console.log("hello!");
    return true;
  }
  async hi() {
    await sleep(2);
    console.log("hi!");
  }
}

async function run() {
  console.log("=== before hello -> hi ===");
  const foo = new Foo;
  await foo.bar();
  console.log("=== after hello -> hi ===");
}

console.log("=== before run ===");
run();
console.log("=== after run ===");
