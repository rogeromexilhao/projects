import 'package:dart_fundamentos/aaaaa/API/repositories/aluno_repository.dart';

Future <void> main() async{
  final alunoRepository = AlunoRepository();

  final alunos = await alunoRepository.buscarTodos();

  print(alunos);

}