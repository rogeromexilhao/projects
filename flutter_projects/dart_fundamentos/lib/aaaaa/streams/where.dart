Future<void> main() async {

  final interval = Duration(seconds: 1);
  var stream = Stream<int>.periodic(interval,callback);

  //vai apenas passar qual valor atender a condição
  stream = stream.where((numero) => numero %6 ==0).take(3);

  stream.listen((numero) { 
    print('valor: $numero');
  });
  

}

int callback(int value){
  return(value + 1) *2;
}