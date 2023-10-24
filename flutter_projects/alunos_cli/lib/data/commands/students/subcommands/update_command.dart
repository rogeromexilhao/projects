import 'dart:io';

import 'package:args/command_runner.dart';

import '../../../adress.dart';
import '../../../city.dart';
import '../../../phone.dart';
import '../../../repositories/product_repository.dart';
import '../../../repositories/students_repository.dart';
import '../../../student.dart';

class UpdateCommand extends Command{

  StudentRepository studentRepository;
  final productRepository = ProductRepository();
  
  @override
  String get description => 'Update student';

  @override
  String get name => 'update';

  UpdateCommand(this.studentRepository){
    argParser.addOption('file', help: 'Path of the csv file', abbr: 'f');
    argParser.addOption('id',help: 'Student ID', abbr: 'i');
  }

  @override
  Future<void> run() async {
    print('aguarde...');
    final filePath = argResults?['file'];
    final id = argResults?['id'];

    final students = File(filePath).readAsLinesSync();
    print('-------------------');

    var student = students.first;

    final studentData = student.split(';');
    final courseCsv = studentData[2].split(',').map((e) => e.trim()).toList();

    final coursesFuture = courseCsv.map((c) async {
      final course = await productRepository.findByName(c);
      course.isStudent = true;
      return course;
    }).toList();

    final courses = await Future.wait(coursesFuture);

    final studentModel = Student(
      id:int.parse(id),
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
      print('--------------------------------');
    
    print('Aluno atualizado');
  }

}