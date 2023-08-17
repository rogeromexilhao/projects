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

  


}