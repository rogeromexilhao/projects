import './styleapp.css'
import veio from '../../images/read_news.jpg'
import logo from  '../../images/logo.svg'
import seta from '../../images/arrow-right.svg'
import aviao_papel from '../../images/send.svg'


export function App() {
  return (
    <body>
      <main>
        <div className="main">

          <div className='logo'>
            <img src={logo}></img>
          </div>

          <br></br>
          <br></br>
          <br></br>

          <div className='title'>
            <p>Atualize ideias e informações em 5 minutos</p>
          </div>

          <br></br>

          <div className='sectitle'>
            <p>Tudo que você precisa saber para começar seu dia bem infomado</p>
          </div>

          <br></br>

          <div className='text'>
            <p>Noticias sobre o universo Rocketseat e tudo o que precisa para começar o dia melhor.</p>
            <p>Perfeito para se preparar para codar !!</p>
          </div>

          <br></br>
          <br></br>
          <br></br>
          
          

          <form action=''> 
            <div class='insert'>
              <p>Insira seu E-mail:</p> 
              <input type='text' placeholder='exemplo@gmail.com'></input>
              <button ><img src={aviao_papel} alt='enviar'></img></button>
            </div>
          </form>
          
          <br></br>
          <br></br>

          <a href='#' className='link'>Deixe-me ler primeiro</a>
        </div>
        <div class='background'>
        </div>
      </main>
      
    </body>

  )
  //<img src={veio} class='background'></img>
}


