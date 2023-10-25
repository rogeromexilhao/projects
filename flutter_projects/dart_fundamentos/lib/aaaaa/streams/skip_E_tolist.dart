Future<void> main() async {

  final interval = Duration(seconds: 1);
  var stream = Stream<int>.periodic(interval,callback);

  //o skip vai pular os 2 primeiro itens da requisição
  //stream = stream.take(5).skip(2);

  //vai skipar td o que n atender a condição
  stream = stream.take(5).skipWhile((numero){
    return numero < 5;
  });

  //ao inves de printar cada valor de um vez retorna uma lista quando td tiver pronto
  //final data = await stream.toList();
  //print(data);


  
  await for(var i in stream){
    print(i);
  }
  

}

int callback(int value){
  return(value + 1) *2;
}