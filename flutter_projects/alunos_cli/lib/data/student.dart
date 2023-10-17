import 'dart:convert';

import 'adress.dart';
import 'courses.dart';

class Student{
  final int? id;
  final String name;
  final int? age;
  final List<String> nameCourses;
  final List<Courses> courses;
  final Adress adress;


  Student({this.id,required this.name,this.age,required this.nameCourses,required this.courses,required this.adress});


  Map<String,dynamic> toMap(){
    final map = <String,dynamic>{
      'id':id,
      'name':name,
      'nameCourses':nameCourses,
      'courses': courses.map((curso) => curso.toMap()).toList(),
      'adress':adress.toMap()
    };
    if(age != null){
      map['age']=age;
    }
    return map;
  }

  String toJson() => jsonEncode(toMap());

  factory Student.fromMap(Map<String,dynamic> map){
    return Student(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      age: map['age'],
      nameCourses: List<String>.from(map['nameCourses'] ?? <String>[]),
      adress: Adress.fromMap(map['adress'] ?? <String,dynamic>{}),
      courses: map['courses']?.map<Courses>((cursoMap) => Courses.fromMap(cursoMap)).toList() ?? <Courses>[]
    );
  }


  factory Student.fromJson(String json) => Student.fromMap(jsonDecode(json));
}