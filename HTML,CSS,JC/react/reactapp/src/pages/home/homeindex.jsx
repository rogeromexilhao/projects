import "./style.css";
import {Card} from '../../componentes/card/CardIndex';
import React, { useState, useEffect} from "react";

export function Home() {
  //criando o estado name (o nome que vai digitar)
  const [studentName, setStudentName] = useState("");
  //criando o estado da lista (vai add os alunos na lista)
  const [students, setStudents] = useState([]);
  const [user, setUser] = useState({ name: "", avatar: "" });

  //função que cria um novo aluno com nome e time 
  function handleAddStudent() {
    const newStudent = {
      //pega o nome que foi digitado
      name: studentName,
      //pega o tempo atual e configura p 2 digitos 
      time: new Date().toLocaleTimeString("pt-BR", {
        hour: "2-digit",
        minute: "2-digit",
        second: "2-digit",
      }),
    };

    //seta a lista com os valores que ja tem com os novos 
    //os 3 pontos do prevState é pra pegar o valor da posição do vetor
    setStudents((prevState) => [...prevState, newStudent]);
  }
  
  //vai pegar as info da api nesse caso somente nome e avatar atribuindo no data
  //fetch("https://api.github.com/users/rogeromexilhao") //meu gh
  useEffect(() => 
  {// Dentro do objeto devemos colocar todas. ações que serão executadas.
   // Os arrays definem quais os estados que o useEffect depende.
  fetch("https://api.github.com/users/rodrigorgtic")
    .then((response) => response.json())
    .then((data) => {
      setUser({
        name: data.name,
        avatar: data.avatar_url,
      });
    });
  }, []);


  return (
    <div className="container">
      <header>
        <h1>Palestrante</h1>
        <div>
          <strong>{user.name}</strong>
          <img src={user.avatar} alt="Foto de perfil" />
        </div>
      </header>

      <h1>Lista de Presença</h1>

      <input
        type="text"
        placeholder="Digite o nome..."
        //vai passar o setStudentName para o studentName
        //setando o valor para o nome 
        onChange={(e) => setStudentName(e.target.value)}
      />

      <button 
        //vai add um evento de clique no botao  
        type="button" 
        onClick={handleAddStudent}
        >
        Adicionar
        </button>
      
      {
      //vai receber o valor da posição do vetor (nome e tempo) e vai passar para as propriedades do card
      //student.map vai mapear o students (vetor) e vai passar para o student assim 
      //vai p as propriedades do card
      students.map((student) => (<Card 
        //key é utilizada para performace fazendo com que quando ha dois valores iguais ele da um erro 
        key = {student.time}
        name={student.name} 
        time={student.time} />))
      }

    </div>
  );
}

  //o useEffect nao pode ser usado de maneira asincrona ent para fazer isso 
  //é necessario criar uma função dentro do useEffect
  /*
  useEffect(() => {
    async function fetchData() {
      const response = await fetch("https://api.github.com/users/birobirobiro");
      const data = await response.json();
      console.log("DADOS =>", data);

      setUser({
        name: data.name,
        avatar: data.avatar_url,
      });
    }

    fetchData();
  }, []);
  */ 


/*
//codigo que o que vc escrever vai aparecer

export function Home() {
  const [studentName, setStudentName] = useState("");

  return (
    <div className="container">
      <h1>Nome: {studentName}</h1>
      <input
        type="text"
        placeholder="Digite o nome..."
        onChange={(e) => setStudentName(e.target.value)}
      />
      <button type="button">Adicionar</button>

      <Card name="Rodrigo" time="10:55:25" />
      <Card name="João" time="11:00:10" />
      <Card name="Ana" time="12:10:33" />
    </div>
  )
}
*/
