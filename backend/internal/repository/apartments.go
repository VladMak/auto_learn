package repository

import (
	"github.com/jmoiron/sqlx"
	"github.com/VladMak/auto_learn/internal/domain"
)

type Apartments interface {
	Create()
	GetAll()
	GetById()
	Delete()
	Update()
}

type ApartmentsPostgres struct {
	db *sqlx.DB
}

func NewApartmentsPostgres(db *sqlx.DB) *ApartmentsPostgres {
	return &ApartmentsPostgres{db: db}
}

func (r *ApartmentsPostgres) Create() {}
func (r *ApartmentsPostgres) GetAll() {}
func (r *ApartmentsPostgres) GetById() {}
func (r *ApartmentsPostgres) Delete() {}
func (r *ApartmentsPostgres) Update() {}