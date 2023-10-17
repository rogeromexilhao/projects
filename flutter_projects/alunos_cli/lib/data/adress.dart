import 'dart:convert';

import 'city.dart';
import 'phone.dart';

class Adress{
  final String street;
  final int number;
  final String zipCode;
  final City city;
  final Phone phone;

  Adress({required this.street,required this.number,required this.zipCode,required this.city,required this.phone});


  Map<String,dynamic> toMap(){
    return{
      'street':street,
      'number':number,
      'zipCode':zipCode,
      'city':city.toMap(), //vai retornar o id e o nome
      'phone':phone.toMap()
    };
  }


  String toJson() => jsonEncode(toMap());

  factory Adress.fromMap(Map<String,dynamic> map){
    return Adress(
      street:map['street'] ?? '',
      number:map['nunumbermero'] ?? 0,
      zipCode:map['zipCode'] ?? '',
      city: City.fromMap(map['city'] ?? <String,dynamic>{}),
      phone: Phone.fromMap(map['phone'] ?? <String,dynamic>{})
    );
  }

  factory Adress.fromJson(String json) => Adress.fromMap(jsonDecode(json));
}