Future<void> main() async {

  final interval = Duration(seconds: 1);
  var stream = Stream<int>.periodic(interval,callback);


  stream = stream.take(10);

  stream.listen((numero) { 
    print('valor: $numero');
  });
  

}

int callback(int value){
  return(value + 1) *2;
}