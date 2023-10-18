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
    print(showcourses);
  }
}