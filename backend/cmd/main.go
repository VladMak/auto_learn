package main

import (
	"github.com/VladMak/auto_learn/internal/domain"
	"github.com/VladMak/auto_learn/internal/handler"
	"github.com/VladMak/auto_learn/internal/repository"
	"github.com/VladMak/auto_learn/internal/service"
	"log"
)

func main() {
	repos := repository.NewRepository()
	services := service.NewService(repos)
	handlers := handler.NewHandler(services)

	srv := new(domain.Server)
	if err := srv.Run("8888", handlers.InitRoutes()); err != nil {
		log.Fatal("error occured while running http server: %s", err.Error())
	}
}