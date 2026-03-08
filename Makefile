.PHONY: dev build clean install-web build-web run dev-web

# Instalar dependencias del frontend
install-web:
	cd web && npm install

# Build del frontend (genera web/dist/)
build-web:
	cd web && npm run build

# Build completo: frontend + backend
build: build-web
	go build -o bin/server.exe ./cmd/server

# Ejecutar en modo producción
run: build
	./bin/server.exe

# Desarrollo: backend solo
dev:
	go run ./cmd/server

# Desarrollo: frontend con hot reload
dev-web:
	cd web && npm run dev

# Limpiar artefactos
clean:
	rm -rf bin/ web/dist/ web/node_modules/
