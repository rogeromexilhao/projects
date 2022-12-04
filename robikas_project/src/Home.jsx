import './assets/css/HomeStyle.css'
import menu from './assets/images/1menu.svg'
import logo from './assets/images/2logo.png'
import product from './assets/images/3product.png'

export default function Home() {
  return (
    <div className='main'>
      <div className='header'>
        <img className='menu' src={menu}></img>
        <img className='logo' src={logo}></img>
        <button className='btn_experimentar'>Experimentar Agora</button>
      </div>

      <div className='introduction'>
        <img className='product' src={product}></img>
      </div>
    </div>
  )
}
