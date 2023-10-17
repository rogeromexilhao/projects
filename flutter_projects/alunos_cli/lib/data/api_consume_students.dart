import './repositories/students_repository.dart';

Future <void> main() async{
  final studentRepository = StudentRepository();

  final student = await studentRepository.findAll();

  print(student);

}