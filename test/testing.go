package main

import (
	"fmt"
	"math/rand"
	"time"
)

// HelloPrinter struct
type HelloPrinter struct{}

// PrintHello method
func (hp HelloPrinter) PrintHello() {
	delay := rand.Intn(4) + 2 // Random between 2 and 5
	time.Sleep(time.Duration(delay) * time.Second)
	fmt.Println("Hello World!")
}

func main() {
	rand.Seed(time.Now().UnixNano())
	hp := HelloPrinter{}
	hp.PrintHello()
}
