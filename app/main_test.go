package main

import (
	"log"
	"os"
	"testing"
)

var a App

func TestMain(m *testing.M) {
	a = App{}
	a.Initialize("mysql", "123456", "phoenix_api")
	ensureTableExists()
	code := m.Run()
	clearTable()
	os.Exit(code)
}
func ensureTableExists() {
	if _, err := a.DB.Exec(tableCreationQuery); err != nil {
		log.Fatal(err)
	}
}
func clearTable() {
	a.DB.Exec("DELETE FROM users")
	a.DB.Exec("ALTER TABLE users AUTO_INCREMENT = 1")
}

const tableCreationQuery = `
CREATE TABLE Users (
	    id INT AUTO_INCREMENT PRIMARY KEY,
	    name VARCHAR(50) NOT NULL,
	    email VARCHAR(50) NOT NULL,
	    password VARCHAR(32) NOT NULL,
	    verified BOOLEAN NOT NULL DEFAULT 0,
	    phone VARCHAR(20) NOT NULL,
	    city INTEGER references(Cities),
	    address varchar(255)
)
`
