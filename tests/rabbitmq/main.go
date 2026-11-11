package main

import (
	"fmt"
	"log"

	amqp "github.com/rabbitmq/amqp091-go"
)

func main() {
	conn, err := amqp.Dial("amqp://user:password@rabbitmq.universe.sync:5672/")
	if err != nil {
		log.Fatal(err.Error())
	}
	defer conn.Close()

	channel, err := conn.Channel()
	if err != nil {
		log.Fatal(err.Error())
	}
	defer channel.Close()

	fmt.Println("connected!")
}
