import 'curso.dart';
import 'endereco.dart';

class Aluno{
  int id;
  String nome;
  int? idade;
  List<String> nomeCurso;
  List<Curso> cursos;
  Endereco endereco;

  Aluno({required this.id,required this.nome,this.idade,required this.nomeCurso,required this.cursos,required this.endereco});
}