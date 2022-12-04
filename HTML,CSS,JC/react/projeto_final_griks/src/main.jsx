import React from 'react'
import ReactDOM from 'react-dom/client'
import {Home} from './pages/Home'

//recebe todo o conteudo do componente 'Home' 

ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <Home/>
  </React.StrictMode>
)