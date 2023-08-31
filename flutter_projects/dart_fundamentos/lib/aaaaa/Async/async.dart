import 'dart:async';

void main(){

  /*
  Future
  var valor = Future(() {
    //função asinc
  }).then((value){
    //registrando função que sera executada quando o futuro for completado com sucesso
  }).catchError((error){
    //registrando função quando sera executado queno o futuro for completado com erro
  }).whenComplete((){
    //registrando a função que sera executada sempre (erro ou secesso)
  });

  */


  Future<int>((){
    return 10~/2;
  }).then((valorOrcamento){
    print('orçamento é de $valorOrcamento reais'); 
  });

  Future<String>((){
    throw Exception('aviao foi de japa');
    return 'comprado';
  }).then((valorOrcamento){
    print('deu bom'); 
  }).catchError((error){
    print('deu ruim!!');
  }).whenComplete(() => print('finalizado'));


  Future<int>((){
    return 20~/2;
  }).then((value) => 
    print('valor calculado $value'
  ));

  //encadeando Futures (chamada em cadeias), geralmente usando quando uma coisa precisa da outra 
  func1().then((value) {
    func2(value).then((value) => print(value));    
  });

  func1()
    .then((value) => func2(value))
    .then((value) => print(value));


  func1()
    .then((value) => func12())
    .then((value) => func13())
    .catchError((error) {
      print('tratando erro 2');
      return func13();
    })
    .then(print)
    .catchError((error) => print('erro em alguma das chamadas'));


  //future.sync
  //a função é executada no momento sem esperar o proximo envet loop
  print('----------------------------------------------------------------');
  print('Init Main');
      
  Future<String>.sync((){
    print('função future executada');
    //throw Exception();
    return 'Future';
  }).then(print);


  //future.microtask
  print('comecando');
  Future<String>(() => 'normal').then(print);
  Future<String>.microtask(() => 'microtask').then(print);
  print('final ');


  //Future.value ou .error
  //Future((){});//dessa maneira esta incompleto
  //mts das vezes o dart ja faz isso sozinho
  //Future.value(''); //sucesso
  //Future.error(''); //erro


  //Future.await
  var f1 = Future.delayed(Duration(seconds: 3), () => 'f1');
  var f2 = Future.delayed(Duration(seconds: 1), () => 'f2');
  var f3 = Future.delayed(Duration(seconds: 3), () => 'f3');
  //var f4 = Future.delayed(Duration(seconds: 1), () => 'f4');

  //fica esperando o ultimo terminar para poder executar
  //se algun deles der erro ele n vai executar nenhum
  //o eagerErro quando esta true faz com que de o erro no instante e dar o catchErro e não apos terminar de executar tds
  /*
  o cleanUp vai ser somente executando quando nos tivermos um erro e vai mostrar qual foi o que deu 'secesso', e posteriormente sabemos o 
  que não foi executado
  porem se td der certo ele n chega a ser executado
  */
  Future.wait([f1,f2,f3], eagerError: true, cleanUp:(secesso){
    print('deu certo');
  }).then((arrayValues){ 
    print(arrayValues);
  });


  //Future.any
  //o any retorna o primeiro valor executado o mais rapido, no exemplo vamos ter o valor com menos deelay
  //o any não cancela os outros valores executado apenas ignora mas é executado
  Future.any([f1,f2,f3])
    .then(print);

  //async vai funcionar como um Future.value


  final alunos  = buscarAlunos();
  alunos.then((aluno) {
    print('total de alunos $aluno');
  }); 
  print('resposta $alunos');

}//void main

Future<int> buscarAlunos() async{
  print('metodo asincrono');
  //o await fica aguardando porem fica dando resposta para ou outros
  final buscandototalalunos = await Future.value(887);
  print('é dps do await');
  return buscandototalalunos;
}

Future<String> func1(){
  return Future.delayed(Duration(seconds: 1),()=> 'Parametro 1');
}

Future<String> func2(String parametro){
  return Future.value('parametro recebido e processado $parametro');
}

Future<String> func11(){
  print('func11');
  return Future.value('fazendo algo func11');
}

Future<String> func12(){
  print('func12');
  return Future.error('fazendo algo func12');
}

Future<String> func13(){
  print('func13');
  return Future.value('fazendo algo func13');
}