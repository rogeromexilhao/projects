import 'dart:convert';

class Cidade{
  int id;
  String nome;

  Cidade({required this.id, required this.nome});


  //serialização
  Map<String, dynamic> toMap (){
    return{
      'id': id,
      'nome':nome
    };
  }

  String toJson() => jsonEncode(toMap());

  //desserialização
  factory Cidade.fromMap(Map<String,dynamic> map){
    return Cidade(
      id:map['id'] ?? 0,
      nome:map['nome'] ?? ''
    );
  }

  factory Cidade.fromJson(String json) => Cidade.fromMap(jsonDecode(json));
}