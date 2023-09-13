import 'package:http/http.dart';
import 'dart:convert';

Future<void> main() async {

  final result = await get(Uri.parse('https://viacep.com.br/ws/01001000/json/'));

  final resultData = json.decode(result.body);

  print(result.body);//resposta em string
  print(resultData);
  print(resultData['uf']);//cada infos


  //resultData.containsKey('error'); serve para verificar se a api retornou um valor erro no json

}