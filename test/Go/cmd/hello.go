package main

import "fmt"

type Message struct {
	message string
}

func NewMessage(m string) *Message {
	return &Message{
		m,
	}
}

func (m *Message) printMessage() {
	fmt.Println(m.message)
}
