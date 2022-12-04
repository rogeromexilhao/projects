/*
componente que retorna imediatamente os diferentes tipos de filmes das 3 categorias disponiveis
(populares,em cartaz,mais avaliados)
*/

import './style.css'
import React, { useState, useEffect} from "react";

export default function dropdown(props) {
    
    //variavel que mostra em que categoria o usuário está
    var cat = ''

    if (props.valor === 'popular'){
         cat = 'Populares'
    }else if (props.valor === 'now_playing'){
        cat = 'Em Cartaz'
    }else if (props.valor === 'top_rated'){
        cat = 'Mais Avaliados'
    }

    return (
        <div className="dropdown">
            <button className="dropbtn">Categorias :</button>
            <div className="dropdown-content">
                <button value={'popular'} onClick={(e)=>props.setcategoria(e.target.value)}>Populares</button>
                <button value={'now_playing'} onClick={(e)=>props.setcategoria(e.target.value)}>Em Cartaz</button>
                <button value={'top_rated'} onClick={(e)=>props.setcategoria(e.target.value)}>Mais Avaliados</button>  
            </div>
            <p>{cat}</p>
        </div>
    );
}
