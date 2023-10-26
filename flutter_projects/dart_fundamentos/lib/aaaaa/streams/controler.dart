import 'dart:async';

Future <void> main() async{
  final controler = StreamController<int>.broadcast();

  final inStream = controler.sink;
  final outStream = controler.stream;

  outStream
    .skip(1)
    .where((numero) => numero%2 == 0)
    .map((numero) => 'valor enviado $numero')
    .listen((strconvertida) => print(strconvertida))
  ;

  var numeros = List.generate(20, (index) => index);

  for(var numero in numeros){
    inStream.add(numero);
    await Future.delayed(Duration(milliseconds: 500));
  }

}