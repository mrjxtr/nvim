package main

import (
	"fmt"
	"math/rand"
	"time"
)

// HelloPrinter struct
type HelloPrinter struct{}

// PrintHello method
func (hp HelloPrinter) PrintHello(text string) error {
	delay := rand.Intn(4) + 2 // Random between 2 and 5
	time.Sleep(time.Duration(delay) * time.Second)
	fmt.Println(text)
	return nil
}

// func main() {
// 	hp := HelloPrinter{}
//
// 	err := hp.PrintHello()
// 	if err != nil {
// 		panic(err)
// 	}
// }
