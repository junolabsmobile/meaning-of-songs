#!/bin/bash
set -e

case "$1" in
  dev)
    echo "Iniciando backend en http://localhost:8080..."
    go run ./cmd/server
    ;;
  dev-web)
    echo "Iniciando frontend en http://localhost:5173..."
    cd web && npm run dev
    ;;
  install-web)
    echo "Instalando dependencias del frontend..."
    cd web && npm install
    ;;
  build-web)
    echo "Compilando frontend..."
    cd web && npm run build
    ;;
  build)
    echo "Compilando frontend..."
    cd web && npm run build
    cd ..
    echo "Compilando backend..."
    go build -o bin/server.exe ./cmd/server
    echo "Build completo: bin/server.exe"
    ;;
  run)
    bash "$0" build
    echo "Ejecutando servidor..."
    ./bin/server.exe
    ;;
  clean)
    rm -rf bin/ web/dist/ web/node_modules/
    echo "Limpieza completa."
    ;;
  *)
    echo "Uso: ./run.sh <comando>"
    echo ""
    echo "Comandos:"
    echo "  dev          Ejecutar backend (puerto 8080)"
    echo "  dev-web      Ejecutar frontend con hot reload (puerto 5173)"
    echo "  install-web  Instalar dependencias del frontend"
    echo "  build-web    Compilar frontend"
    echo "  build        Compilar frontend + backend"
    echo "  run          Compilar y ejecutar en producción"
    echo "  clean        Limpiar artefactos"
    ;;
esac
