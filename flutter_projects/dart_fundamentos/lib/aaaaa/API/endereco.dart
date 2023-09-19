import 'dart:convert';

import 'telefone.dart';
import 'cidade.dart';

class Endereco{
  String rua;
  int numero;
  String cep;
  Cidade cidade;
  Telefone telefone;


  Endereco({required this.rua,required this.numero,required this.cep,required this.cidade,required this.telefone});

  Map<String,dynamic> toMap(){
    return{
      'rua':rua,
      'numero':numero,
      'CEP':cep,
      'cidade':cidade.toMap(), //vai retornar o id e o nome
      'telefone':telefone.toMap()
    };
  }

  String toJson() => jsonEncode(toMap());

  factory Endereco.fromMap(Map<String,dynamic> map){
    return Endereco(
      rua:map['rua'] ?? '',
      numero:map['numero'] ?? 0,
      cep:map['CEP'] ?? '',
      cidade: Cidade.fromMap(map['cidade'] ?? {}),
      telefone: Telefone.fromMap(map['telefone'] ?? {})
    );
  }


  factory Endereco.fromJson(String json) => Endereco.fromMap(jsonDecode(json));

}