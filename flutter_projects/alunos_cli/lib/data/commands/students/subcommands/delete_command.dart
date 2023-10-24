import 'dart:io';

import 'package:args/command_runner.dart';

import '../../../repositories/students_repository.dart';

class DeleteCommand extends Command{

  final StudentRepository studentRepository;

  @override
  String get description => 'Delete student by id';

  @override
  String get name => 'delete';


  DeleteCommand(this.studentRepository){
    argParser.addOption('id',help: 'Student Id',abbr: 'i');
  }

  @override
  Future<void> run() async {
    final id = int.parse(argResults?['id']);
    final studentName = await studentRepository.findById(id);
    print('deseja excluir o aluno ${studentName.name} (s ou n)');

    final confirmDelete = stdin.readLineSync();

    if(confirmDelete?.toLowerCase() == 's'){
      await studentRepository.deleteById(id);
      print('------------------------');
      print('Aluno deletado !!!');
    }else{
      print('cancelado');
    }
  }

}