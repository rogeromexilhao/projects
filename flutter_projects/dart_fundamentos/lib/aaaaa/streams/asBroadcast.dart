Future<void> main() async {

  final interval = Duration(seconds: 1);
  var stream = Stream<int>.periodic(interval,callback);

  //permite que + de 1 pessoa pode ficar escutando a stream
  stream = stream.asBroadcastStream();

  stream = stream.take(10);

  stream.listen((numero) { 
    print('valor 1: $numero');
  });

  stream.listen((numero) { 
    print('valor 2: $numero');
  });
  

}

int callback(int value){
  return(value + 1) *2;
}