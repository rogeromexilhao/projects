import 'package:args/command_runner.dart';

import '../../../repositories/students_repository.dart';
import '../students_commands.dart';

class FindByIdCommand extends Command{

  final StudentRepository studentRepository;

  @override
  String get description => 'Find students by id';

  @override
  String get name => 'byId';

  FindByIdCommand(this.studentRepository){
    argParser.addOption('id',help: 'Student Id',abbr: 'i');
  }

  @override
  Future<void> run() async {
    if(argResults?['id'] == null){
      print('ta errado esse trem');
      return;
    }

    final id = int.parse(argResults?['id']);

    print('Buscando dados...');
    final students = await studentRepository.findById(id);
    
    //final showcourses = stdin.readLineSync();
    print('--------------------');
    print('Alunos: ${students.name}');
    //print('Nome: ${students.name}');
    print('Idade: ${students.age ?? 'nao informado'}');
    print('Curso: ');
    students.nameCourses.forEach(print);
    print('Endereço: ');
    print('${students.address.street} ${students.address.zipCode}');

  }
}