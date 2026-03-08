import { useState, useEffect } from 'react'
import './App.css'

function App() {
  const [status, setStatus] = useState<string>('cargando...')

  useEffect(() => {
    fetch('/api/health')
      .then(res => res.json())
      .then(data => setStatus(data.status))
      .catch(() => setStatus('error de conexión'))
  }, [])

  return (
    <div className="App">
      <h1>Hola Mundo</h1>
      <p>Descubre el significado de tus canciones favoritas</p>
      <p>Estado del servidor: <strong>{status}</strong></p>
    </div>
  )
}

export default App
