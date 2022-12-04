import React from 'react'
import ReactDOM from 'react-dom'
import { Home } from './pages/home/homeindex'
import './styles/global.css';

/*
foi importado desse jeito do vite pra mim 
ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
)
*/

//na aula estava desse jeito 
ReactDOM.render(
  <React.StrictMode>
    <Home/>
  </React.StrictMode>,
  document.getElementById('root')
)
