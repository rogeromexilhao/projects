import 'dart:convert';
import 'package:http/http.dart' as http;
import '../student.dart';

class StudentRepository{
  Future<List<Student>> buscarTodos() async{
    final studentsResponse = await http.get(Uri.parse('http://localhost:8080/students'));

    final studentsList = jsonDecode(studentsResponse.body);

    final allStudents = studentsList.map<Student>((alunoMap){
      return Student.fromMap(alunoMap);
    }).toList();

    return allStudents;
  }
}