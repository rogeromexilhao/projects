import perfil from '../../images/ft de perfil.jpeg'
import './stylehome.css'
import git from '../../images/github.svg'
import insta from '../../images/instagram.svg'
import linkedin from '../../images/linkedin.svg'
import twitch from '../../images/twitch.svg'
import tt from '../../images/twitter.svg'

export function Home() {

  return (
    <div className='container'>
      <body>
        <div className='cima'>
          <img src={perfil}/>
        </div>
        <p>@instagram</p>
        <br></br>
        <br></br>
        <a href='https://www.youtube.com' title='YouTube' target='_blank'><button class='button'>YOUTUBE</button></a>
        <br></br>
        <br></br>
        <a href='https://www.rocketseat.com.br' title='Rocketseat' target='_blank'><button class='button'>ROCKETSEAT</button></a>
        <br></br>
        <br></br>
        <a href='https://site.ucdb.br' title='UCDB' target='_blank'><button class='button'>UCDB</button></a>
        <br></br>
        <br></br>
        <a href='https://developer.mozilla.org/pt-BR/' title='MDN' target='_blank'><button class='button'>MDN</button></a>
        <br></br>
        <br></br>
        <div className='baixo'>
          <img src={tt}/>
          <img src={twitch}/>
          <img src={insta}/>
          <img src={linkedin}/>
          <img src={git}/>
        </div>
      </body>
    </div>
  );
}


