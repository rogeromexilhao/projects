Future<void> main() async {

  final interval = Duration(seconds: 2);
  var stream = Stream<int>.periodic(interval,callback);

  //'corta' a stream ou seja dps de 5 requisições ela mata o programa
  //stream = stream.take(5);

  //o e takewhile vai matar o programa apos atender alguma condição
  stream = stream.takeWhile((int numero) => numero < 10);

  await for(var i in stream){
    print(i);
  }

}

int callback(int value){
  return(value + 1) *2;
}