package main

import (
	"database/sql"
	"fmt"

	"github.com/lib/pq"
)

func main() {
	conn, err := pq.NewConnectorConfig(pq.Config{
		Host:     "pgsql.universe.sync",
		Port:     5432,
		Database: "db_example",
		User:     "user",
		Password: "password",
		SSLMode:  pq.SSLModeDisable,
	})
	if err != nil {
		panic(err)
	}

	db := sql.OpenDB(conn)
	defer db.Close()

	if err := db.Ping(); err != nil {
		panic(err)
	}
	fmt.Println("connected!")
}
