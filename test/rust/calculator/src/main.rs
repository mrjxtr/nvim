use std::io::{self, Write};

fn main() {
    println!("Simple Rust Calculator");
    println!("Type an expression like: 1 + 2 * 3 / 9");
    println!("Type 'exit' or 'quit' to stop.\n");
    let _x: i32 = rand::random();

    loop {
        print!("> ");
        io::stdout().flush().unwrap(); // ensure prompt shows up

        let mut input = String::new();
        if io::stdin().read_line(&mut input).is_err() {
            println!("Failed to read input.");
            continue;
        }

        let input = input.trim();
        if input.eq_ignore_ascii_case("exit") || input.eq_ignore_ascii_case("quit") {
            println!("Goodbye!");
            break;
        }

        match meval::eval_str(input) {
            Ok(result) => println!("= {}", result),
            Err(e) => println!("Error: {}", e),
        }
    }
}
