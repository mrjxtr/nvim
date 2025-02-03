package main

var hp = HelloPrinter{}

func main() {
	text := "Hello world!"
	err := hp.PrintHello(text)
	if err != nil {
		panic(err)
	}
}
