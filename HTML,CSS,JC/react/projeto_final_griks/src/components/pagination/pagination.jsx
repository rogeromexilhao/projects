/*
componente que exibe os filmes da pagina indicada da lista de filmes 
*/

import './style.css'

export default function pagination(props) {

    return (
        <div className="pagination">
            <p>Page {props.valor}</p>
            <button value={props.valor-1} onClick={(e)=>props.setpagina(e.target.value)}>Prev</button>
            <button value={1} onClick={(e)=>props.setpagina(e.target.value)}>1</button>
            <button value={2} onClick={(e)=>props.setpagina(e.target.value)}>2</button>
            <button value={3} onClick={(e)=>props.setpagina(e.target.value)}>3</button>
            <button value={4} onClick={(e)=>props.setpagina(e.target.value)}>4</button>
            <button value={5} onClick={(e)=>props.setpagina(e.target.value)}>5</button>
            <button value={6} onClick={(e)=>props.setpagina(e.target.value)}>6</button>
            <button value={props.valor+1} onClick={(e)=>props.setpagina(e.target.value)}>Next</button>
        </div>   
    );
  }
