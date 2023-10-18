import 'dart:convert';
import 'package:http/http.dart' as http;
import '../student.dart';

class StudentRepository{
  Future<List<Student>> findAll() async{
    final studentsResponse = await http.get(Uri.parse('http://localhost:8080/students'));

    if(studentsResponse.statusCode != 200){
      throw Exception();
    }

    final studentsList = jsonDecode(studentsResponse.body);

    final allStudents = studentsList.map<Student>((alunoMap){
      return Student.fromMap(alunoMap);
    }).toList();

    return allStudents;
  }

  Future<Student> findById(int id) async{
    final studentsResponse = await http.get(Uri.parse('http://localhost:8080/students/$id'));

    if(studentsResponse.statusCode != 200){
      throw Exception();
    }

    if(studentsResponse.body == '{}'){
      throw Exception();
    }

    return Student.fromJson(studentsResponse.body);
  }

  Future<void> insert(Student student) async{
    final response = await http.post(Uri.parse('http://localhost:8080/students'),
        body: student.toJson(),
        headers: {
          'content-type': 'application/json'
        }
      );

    if(response.statusCode != 200){
      throw Exception();
    }
  }

  Future<void> update(Student student) async{
    final response = await http.put(Uri.parse('http://localhost:8080/students/${student.id}'),
        body: student.toJson(),
        headers: {
          'content-type': 'application/json'
        }
      );

    if(response.statusCode != 200){
      throw Exception();
    }
  }

  Future<void> deleteById(int id) async{
    final response = await http.delete(Uri.parse('http://localhost:8080/students/$id'));

    if(response.statusCode != 200){
      throw Exception();
    }
  }
  
  
}