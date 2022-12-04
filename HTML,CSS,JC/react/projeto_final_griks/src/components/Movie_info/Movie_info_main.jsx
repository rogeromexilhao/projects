/*
quando a condição para este componente é atendida (clicando no titulo de algum filme na 'Home')
retorna na pagina inteira o:titulo,imagem,descrção,avaliação e data de lançamento  
*/
import './style.css'
import React, { useState, useEffect} from "react";

export default function movie_info(props) {

    const [aux,setAux] = useState({name:'',poster:'',description:'',rate:'',relaese:''});

    //utilização de um outro metodo para o consumo da api para filmes expecíficos 
    useEffect(() => 
    {
    fetch(`https://api.themoviedb.org/3/movie/${props.valueID}?api_key=28a5f7016bbf366b51e3cc911492ba18&language=pt-BR`)
      .then((response) => response.json())
      .then((data) => {
        setAux({
          name: data.title,
          poster: data.backdrop_path,
          description: data.overview,
          rate:data.vote_average,
          relaese: data.release_date,
        });
      });
    }, []);

    //transformando de string para float 
    parseFloat(aux.rate)
    
    //criação de uma variavel para utilizar no arredondamento 
    var rnd = parseFloat(aux.rate)

    //criação de uma variavel para a conversão de datas no padrao US para BR
    var data_brasileira = aux.relaese.split('-').reverse().join('/');
    
    return (
        <div className="MovieInfo">
            <button value={''} onClick={(e)=>props.setinfo(e.target.value)}> &lt;- Voltar</button>
            <h1>{aux.name}</h1>
            <img src={"https://image.tmdb.org/t/p/w500" + aux.poster} alt={props.path} ></img>
            <p><u>Descrição:</u></p>
            <p>{aux.description}</p>
            <br/>
            <p><u>Avaliação :</u> {rnd.toFixed(1)*10}%</p>
            <br/>
            <p><u>Data de lançamento :</u> {data_brasileira}</p>
        </div>
    );
  }