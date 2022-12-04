/*
pagina principal onde mostra todos os filme e operações que são executadas enquanto 
o usuário está utilizando
*/

//importações de componentes 
import '../pages/style.css'
import React, { useState, useEffect} from "react";
import Movie from './Movies';
import Pagination from '../components/pagination/pagination'
import Dropdown from '../components/dropdown/dropdown'
import MovieInfo from '../components/Movie_info/Movie_info_main'

export function Home() {
  //declaração de variaveis 
  const [pagina,setPagina] = useState(1);

  const [categoria,setCategoria] = useState('popular');

  const [info,setInfo] = useState('');

  const [popular,setPopular] = useState([]);

  //url base para o consumo da api que recebe a 'categoria' do 'dropdown' e a 'pagina' pelo 'pagination'
  const url = `https://api.themoviedb.org/3/movie/${categoria}?api_key=28a5f7016bbf366b51e3cc911492ba18&language=en-US&page=${pagina}`
  
  //renderização dos elementos
  useEffect(()=>{
    fetchPopular();
  },[pagina,categoria,info]);

  //utilização de uma função assíncrona para o consumo da api
  const fetchPopular = async()=>{
    const data = await fetch(url);
    const movie = await data.json();
    setPopular(movie.results)
  };

  return (
    /*
    passando props para alguns componentes 
    e utilizando uma exceção para a exibição do menu principal ou de infomaçãoes
    de apenas um filme utilizando a variavel 'info' como condição
    fazendo com que somente uma sera exibida
    */
    <div className="app">
      {info == '' ? 
      <div>
        <h1>Griks's Movies</h1>
        <Dropdown valor={categoria} setcategoria={setCategoria}/>
        <div className="popular-movies">
          {popular.map((movie) => {return <Movie key={movie.id} movie={movie} setinfo={setInfo}/>})}
        </div>
        <Pagination valor={parseFloat(pagina)} setpagina={setPagina}/> 
      </div> : 
      <div>
        <MovieInfo valueID={info} setinfo={setInfo}></MovieInfo>
      </div>}
    </div>
  )
}

