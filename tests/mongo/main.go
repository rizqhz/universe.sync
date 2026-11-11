package main

import (
	"context"
	"fmt"

	"go.mongodb.org/mongo-driver/v2/bson"
	"go.mongodb.org/mongo-driver/v2/mongo"
	"go.mongodb.org/mongo-driver/v2/mongo/options"
)

func main() {
	opts := options.Client().ApplyURI("mongodb://user:password@mongo.universe.sync:27017/")
	client, err := mongo.Connect(opts)
	if err != nil {
		panic(err)
	}
	defer client.Disconnect(context.TODO())

	// Sends a ping to confirm a successful connection
	var result bson.M
	err = client.Database("admin").
		RunCommand(context.TODO(), bson.D{{"ping", 1}}).
		Decode(&result)
	if err != nil {
		panic(err)
	}
	fmt.Println("Pinged your deployment. You successfully connected to MongoDB!")
}
