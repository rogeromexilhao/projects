import 'dart:io';

import 'package:args/command_runner.dart';

import '../../../repositories/students_repository.dart';

class FindAllCommand extends Command{

  final StudentRepository repository;

  @override
  String get description => 'Find all Students';

  @override
  String get name =>'findAll';

  FindAllCommand(this.repository);
  
  @override
  Future<void> run() async {
    print('Buscando alunos...');
    final students = await repository.findAll();
    print('apresentar tambem os cursos? (s ou n)');
    final showcourses = stdin.readLineSync();
    print('--------------------');
    print('Alunos:');
    print('--------------------');
    for(var student in students){
      if(showcourses?.toLowerCase() == 's'){
        print('${student.id} - ${student.name} - ${student.courses.where((course) => course.isStudent).map((e) => e.name).toList()}');
      }else{
        print('${student.id} - ${student.name}');
      }
    }
  }
}