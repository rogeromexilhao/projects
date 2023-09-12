
import 'dart:convert';

void main(){

  //aki não pode ser aspas simples
  final jsonCEP = '''
  {
  "cep": "12345-678",
  "logradouro": "Rua das Flores",
  "complemento": "Apto 101",
  "bairro": "Jardim Botânico",
  "localidade": "Cidade Exemplo",
  "uf": "EX",
  "ibge": "1234567",
  "gia": "9876",
  "ddd": "99",
  "siafi": "8765"
  }
  ''';


  final data = json.decode(jsonCEP);//isso vai virar um mapa dinamico

  print(data['complemento']);//para acessar os dados do json

  final jsonMap = {'curso':'academia do flutter','alunos':1000};//aki pode ser aspas simples 

  print(json.encode(jsonMap));//para transoforma em json
}