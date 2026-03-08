package domain

import "context"

// SongRepository es el puerto de salida para persistencia.
// Cualquier adaptador (memoria, PostgreSQL, MongoDB) debe implementar esta interfaz.
type SongRepository interface {
	FindByID(ctx context.Context, id string) (*Song, error)
	FindAll(ctx context.Context) ([]Song, error)
	Save(ctx context.Context, song *Song) error
}
