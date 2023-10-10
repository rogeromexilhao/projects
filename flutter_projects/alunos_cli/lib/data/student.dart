import 'dart:convert';

import 'adress.dart';
import 'courses.dart';

class Student{
  int id;
  String name;
  List<String> nameCourses;
  List<Courses> courses;
  Adress adress;


  Student({required this.id,required this.name,required this.nameCourses,required this.courses,required this.adress});


  Map<String,dynamic> toMap(){
    return{
      'id':id,
      'name':name,
      'nameCourses':nameCourses,
      'courses': courses.map((curso) => curso.toMap()).toList(),
      'adress':adress.toMap()
    };
  }

  String toJson() => jsonEncode(toMap());

  factory Student.fromMap(Map<String,dynamic> map){
    return Student(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      nameCourses: List<String>.from(map['nameCourses'] ?? <String>[]),
      adress: Adress.fromMap(map['adress'] ?? <String,dynamic>{}),
      courses: map['courses']?.map<Courses>((cursoMap) => Courses.fromMap(cursoMap)).toList() ?? <Courses>[]
    );
  }


  factory Student.fromJson(String json) => Student.fromMap(jsonDecode(json));
}