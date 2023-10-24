import 'dart:io';

import 'package:args/command_runner.dart';

import '../../../adress.dart';
import '../../../city.dart';
import '../../../phone.dart';
import '../../../repositories/product_repository.dart';
import '../../../repositories/students_repository.dart';
import '../../../student.dart';

class InsertCommand extends Command{
  
  final StudentRepository studentRepository;
  final productRepository = ProductRepository();

  @override
  String get description => 'Insert Student';

  @override
  String get name => 'insert';

  InsertCommand(this.studentRepository){
    argParser.addOption('file', help: 'Path of the csv file', abbr: 'f');
  }
  
  @override
  Future<void> run() async {
    print('aguarde... inserindo alunos');
    final filePath = argResults?['file'];
    final students = File(filePath).readAsLinesSync();
    print('-------------------');

    for(var student in students){
      final studentData = student.split(';');
      final courseCsv = studentData[2].split(',').map((e) => e.trim()).toList();

      final coursesFuture = courseCsv.map((c) async {
        final course = await productRepository.findByName(c);
        course.isStudent = true;
        return course;
      }).toList();

      final courses = await Future.wait(coursesFuture);

      final studentModel = Student(
        name: studentData[0],
        age: int.tryParse(studentData[1]),
        nameCourses: courseCsv,
        courses: courses,
        address: Address(
          street: studentData[3],
          number: int.parse(studentData[4]), 
          zipCode: studentData[5], 
          city: City(id: 1, name: studentData[6]), 
          phone: Phone(
            ddd: int.parse(studentData[7]),
            phone: studentData[8]
            )
          )
        );

        await studentRepository.insert(studentModel);
    }
    print('Alunos add');
  }
}