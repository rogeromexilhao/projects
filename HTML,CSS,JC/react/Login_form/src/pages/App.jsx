import './style.css'
import carro from '../images/side-image.jpg'
import check from '../images/check.svg'
import eye from '../images/eye.svg'
import cadeadofocado from '../images/lock-focus.svg'
import cadeado from '../images/lock.svg'
import login from '../images/log-in.svg'
import logo from '../images/logo.svg'
import email from '../images/mail.svg'
import emailfocado from '../images/mail-focus.svg'


export function App() {
  return (
    <div className='container'>
      <img src={logo} className='logo'></img>
      <img src={carro} className='carro'></img>

      <fieldset className='formulario'>
        <img src={login} className='login'></img>
        <h1>Faça seu login</h1>
        <p>Entre com suas informações de cadastro</p>
        
        <br/>

        <b>E-mail</b>
        
        <br/>
        
        <input type='text' placeholder='Digite seu e-mail' ></input>
        
        <br/>
        <br/>
        

        <b>Senha</b>

        <br/>

        <input type='text' placeholder='Digite sua senha' ></input>

        <br/>
        <br/>

        <input type='checkbox' className='CB'></input>
        <b className='lembreme'>Lembre-me</b>
        <a className='esqueci_senha' href='senha esquecida'>Esqueci Minha Senha</a>

        <button>ENTRAR</button>
        
        <br/>
        <br/>
        <br/>
        <br/>
        
        <p className='Nconta'>Não tem conta?<a className='esqueci_senha' href='registrar'>Registrar-se</a></p>
      </fieldset>
    </div>
  )
}


