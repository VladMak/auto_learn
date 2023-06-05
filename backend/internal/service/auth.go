package service

import (
	"github.com/VladMak/auto_learn/internal/repository"
	"github.com/VladMak/auto_learn/internal/domain"
	"crypto/sha1"
	"fmt"
)

const salt = "webksdkp18593lsdllbj"

type AuthService struct {
	repo repository.Authorization
}

func NewAuthService(repo repository.Authorization) *AuthService {
	return &AuthService{repo: repo}
}

func (s *AuthService) CreateUser(user domain.User) (int, error) {
	user.Password = generatePasswordHash(user.Password)
	return s.repo.CreateUser(user)
}

func generatePasswordHash(password string) string {
	hash := sha1.New()
	hash.Write([]byte(password))

	return fmt.Sprintf("%x", hash.Sum([]byte(salt)))
}