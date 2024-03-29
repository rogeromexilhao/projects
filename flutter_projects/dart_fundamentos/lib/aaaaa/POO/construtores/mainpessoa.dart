import 'dart:mirrors';

import './pessoa.dart';

void main(){
  //setando da primeira forma
  //var pessoa = Pessoa('rodrigo',38,'masc');

  //usando o required com this
  var pessoa = Pessoa(
    nome:'rodrigo',
    idade:38,
    sexo:'masc');


  print(pessoa.idade);

  Pessoa.semnome(idade: 29, sexo: 'fem');

  var pessoafab = Pessoa.fabrica('teste bao');

  //---------------------------------------------------------------- herança 
  var chahorro = Cahorro();
  chahorro.idade = 10;
  print(chahorro.recuperarIdade());
  print(chahorro.calcularIdadehumana());


  var joao = Joao();
  print(joao.habilidade());
  print(joao.dancar());
  print(joao.cantar());

  //cascade notation (os .. apos os parentes)
  var pessoa3 = Pessoa3()
    ..nome = 'rodrigo lago'
    ..email = 'rodrigo.lago@gmail.com'
    ..site = 'http://rodrigtop.com';

  print(pessoa3.site);


  //operator methods
  var num = Numeros(10);
  var num2 = Numeros(20);

  var soma = num + num2;

  print(soma.i);


  var cliente2 = Cliente2(
    //cpf: '07793240138',
    //nome: 'rodrigo',
    razao: 'ganadero',
    cnpj: '123454124'
  );


  var p1 = const Pessoa4(nome: 'rodrigo',idade: 12);
  var p2 = const Pessoa4(nome: 'rodrigo',idade: 12);

  print(p1==p2);


  var nome4 = 'Rodrigo lago';

  print(nome4.saudacao());


  final p5 = Pessoa5();

  var instenceMirror = reflect(p5);
  var classMirror = instenceMirror.type;

  classMirror.metadata.forEach((annotation){
    var instanceAnnotation = annotation.reflectee;
    if(instanceAnnotation is Fazer){
      print(instanceAnnotation.quem);
      print(instanceAnnotation.oque);
    }
  });


  var pessoa6 = Pessoa6();
  pessoa6.nome = 'cleber';
  print(pessoa6.nome);


  final nomes7 = ['rodrigo','cleber','joao','zeberson'];

  final pessoa7 = nomes7.map<Pessoa7>(Pessoa7.new).toList();

  for (var pessoa7 in pessoa7) {
    print('ola ${pessoa7.nome}');
  }



  final caixa = Caixa<Bola>();

  //tenho que passar o bola
  caixa.adicionar(Bola());
  caixa.getItens();
  Bola? itemCaixa = caixa.getItens();

  final caixaBoneca = Caixa<Boneca>();
  caixaBoneca.adicionar(Boneca());
  Boneca? item = caixaBoneca.getItens();

}