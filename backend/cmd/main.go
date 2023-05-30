package main

import (
	"github.com/VladMak/auto_learn/internal/domain"
	"github.com/VladMak/auto_learn/internal/handler"
	"log"
)

func main() {
	handlers := new(handler.Handler)
	srv := new(domain.Server)
	if err := srv.Run("8888", handlers.InitRoutes()); err != nil {
		log.Fatal("error occured while running http server: %s", err.Error())
	}
}