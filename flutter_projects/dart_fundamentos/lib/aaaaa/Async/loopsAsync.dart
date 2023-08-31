Future<void> main() async{
  final nomes =['cleiton','rodrigo','alex'];

  /*
  for(var nome in nomes){
    await tratarsaudacao(nome);
  }
  */

  Future.forEach<String>(nomes, (nome) async {
    await tratarsaudacao(nome);
  });

}
Future<void> tratarsaudacao(String nome) async{
  final saudacaonome = await saudacao(nome);
  print(saudacaonome);
}

Future<String> saudacao(String nome)async{
  print('inicio saudacao $nome');
  return Future.delayed(Duration(seconds: 2),(){
    print('fim saudacao $nome');
    return 'ola $nome';
  });
}