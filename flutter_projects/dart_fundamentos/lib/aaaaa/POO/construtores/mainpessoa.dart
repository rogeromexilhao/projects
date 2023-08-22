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

}