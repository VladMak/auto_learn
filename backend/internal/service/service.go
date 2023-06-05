package service

import (
	"github.com/VladMak/auto_learn/internal/repository"
	"github.com/VladMak/auto_learn/internal/domain"
)

type Authorization interface {
	CreateUser(user domain.User) (int, error)
}

type TodoList interface {

}

type TodoItem interface {

}

type Service struct {
	Authorization
	TodoList
	TodoItem
}

func NewService(repos *repository.Repository) *Service {
	return &Service{
		Authorization: NewAuthService(repos.Authorization),	
	}
}