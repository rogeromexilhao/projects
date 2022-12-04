/*
o componente 'Movies' faz com que a imagem e o titulo do filme apareçam na pagina inicial
se adaptando tb com as alterações feitas nos componentes: 'pagination' e 'dropdown'
*/

import React, { useState, useEffect} from "react";

const Movie = ({movie,setinfo}) => {

  return (
    <div>
      <button className="titulo" onClick={()=>setinfo(movie.id)}>{movie.title}</button>
      <img src={"https://image.tmdb.org/t/p/w500" + movie.backdrop_path} alt={movie.path} />
    </div>
  );
};
export default Movie;
