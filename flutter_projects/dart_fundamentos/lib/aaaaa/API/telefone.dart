import 'dart:convert';

class Telefone{
  int ddd;
  String telefone;

  Telefone({required this.ddd,required this.telefone});
  
  //serialização
  //passo 1 mapa de chave valor
  Map<String,dynamic> toMap(){
    return{'ddd':ddd,'telefone':telefone};
  }

  //passo 2 
  String toJson() => jsonEncode(toMap());


  factory Telefone.fromMap(Map<String,dynamic> map){
    return Telefone(
      ddd:map['ddd'] ?? 0,
      telefone:map['telefone'] ?? ''
    );
  }


  factory Telefone.fromJson(String json){
    final jsonMap = jsonDecode(json);
    return Telefone.fromMap(jsonMap);
  }
}