import 'dart:convert';
import 'package:http/http.dart' as http;
import '../aluno.dart';

class AlunoRepository{
  Future<List<Aluno>> buscarTodos() async{
    final alunosResponse = await http.get(Uri.parse('http://localhost:8080/alunos'));

    final alunosList = jsonDecode(alunosResponse.body);

    final todosAlunos = alunosList.map<Aluno>((alunoMap){
      return Aluno.fromMap(alunoMap);
    }).toList();

    return todosAlunos;
  }
}