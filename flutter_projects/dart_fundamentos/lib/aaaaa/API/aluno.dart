import 'dart:convert';

import 'curso.dart';
import 'endereco.dart';

class Aluno{
  int id;
  String nome;
  int? idade;
  List<String> nomeCursos;
  List<Curso> cursos;
  Endereco endereco;

  Aluno({required this.id,required this.nome,this.idade,required this.nomeCursos,required this.cursos,required this.endereco});


  Map<String,dynamic> toMap(){
    final map = <String,dynamic>{
      'id':id,
      'nome':nome,
      'nomeCursos':nomeCursos,
      'cursos': cursos.map((curso) => curso.toMap()).toList(),
      'endereco':endereco.toMap()
    };

    if(idade != null) {
      map['idade']=idade;
    }

    return map;
  }

  String toJson() => jsonEncode(toMap());

  factory Aluno.fromMap(Map<String,dynamic> map){
    return Aluno(
      id: map['id'] ?? 0,
      nome: map['nome'] ?? '',
      idade: map['idade'],
      nomeCursos: List<String>.from(map['nomeCursos'] ?? <String>[]),
      endereco: Endereco.fromMap(map['endereco'] ?? <String,dynamic>{}),
      cursos: map['cursos']?.map<Curso>((cursoMap) => Curso.fromMap(cursoMap)).toList() ?? <Curso>[]
    );
  }


  factory Aluno.fromJson(String json) => Aluno.fromMap(jsonDecode(json));

  @override
  String toString(){
    return 'Aluno: $nome($id)';
  }
}