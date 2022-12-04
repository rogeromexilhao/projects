import './style.css'
import BGesquerda from '../images/blur-1.png'
import BGdireita from '../images/blur-2.png'
import cafe from '../images/rocket-coffee.png'
import logo from '../images/logo-desktop.svg'

export function App() {
  return (
    <>
      <img src={BGesquerda} className='esquerda'/>
      <img src={BGdireita} className='direita'/>
      <div className='header'>
        <img src={logo}/>
        <a href='1'>Home</a>
        <a href='2'>Menu</a>
        <a href='3'>Reconpensas</a>
        <a href='4'>Gift Cards</a>
        <a href='5'>Lojas</a>
        <br/>
        <button>Pegar meu café</button>
      </div>

      <div className='container'>
        <h1 className='t1'>Great Coffe</h1>
        <h1 className='t2'>&lt;Greate Code/&gt;</h1>
        <img src={cafe}/>
      </div>
    </>
  )
}


