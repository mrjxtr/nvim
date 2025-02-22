import { sleep } from "https://deno.land/x/sleep/mod.ts";

class HelloPrinter {
  static async printHello() {
    const delay = Math.floor(Math.random() * (5 - 2 + 1)) + 2; // Random between 2 and 5
    await sleep(delay);
    console.log("Hello World!");
  }
}

if (import.meta.main) {
  await HelloPrinter.printHello();
}
