void main(){
  final aguardando =inserirlento();
  aguardando
    .timeout(Duration(seconds: 1))//o timeout n cancela o future, ele vai mostrar que alguma coisa n aconteceu no tempo desejado
    //e continua a execução
    .catchError((error){print('terminou com erro');
    });

}

Future<void> inserirlento(){
  return Future.delayed(Duration(seconds: 3),(){
    print('terminou o inset');
  });
}