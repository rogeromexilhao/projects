import 'dart:async';

void main(){

  buscaralgo(0)
    .then((value) => print('mensagem: $value'))
    .catchError((err) => print('erro: $err'));

}

Future<String> buscaralgo(int numero){
  final completer = Completer<String>();

  Timer(Duration(seconds: 2),(){
    if(numero == 0){
      completer.complete('numeor enviadop');
    }else{
      completer.completeError('enviado com erro');
    }
  }); 

  return completer.future;

}