class Pessoa{
  String? nome;
  int? idade;
  String? sexo;

  //constructor default toas as classes tem
  //Pessoa();
  /*
  Pessoa(String nomeConst, int idadeConst, String sexoConst){
    nome = nomeConst;
    idade = idadeConst;
    sexo = sexoConst;
  }
  */

  //podemos fazer de outra forma tb (acredito eu mais simples e clean)
  Pessoa({
    required this.nome,
    required this.idade,
    required this.sexo
    });


  /*dessa forma usando o required temos que obrigatoriamente passar um dado
  Paessoa({required String nomeConst,required int idadeConst,required String sexoConst}){
    nome = nomeConst;
    idade = idadeConst;
    sexo = sexoConst;
  }
  */
  //construtor nomeado
  Pessoa.semnome({
    required this.idade,
    required this.sexo
  });

  Pessoa.vazia();

  //construtor factory faz uma regra de negocio para a criação da classe antes de retornar o que vc quer]
  //vc tb n pode passar o 'this' nesse constructor
  factory Pessoa.fabrica(String nomeConst){
    var nome = nomeConst +'Fabrica';
    var pessoa = Pessoa.vazia();
    pessoa.nome = nome;
    return pessoa;
    // ela somente vai existir quando retornar o 'pessoa'

    //atributos privados n poddem ser acessaos diretamente

  }

}

class Cliente {
  late String nome;//atributo que vai ser inicializado dps (alguma hora ele vai ser inicializado)
  //o late com outras inicializações como o 'final' pode dar problema na execução o, late sobreescreve outra regras de inicialização
  //e com o ! (force non null)

  Cliente({required String nome}): nome = nome;
}

abstract class Animal {
  String? tamanho;
  int? idade;

  int recuperarIdade(){
    return idade ?? 0 ;
  }

  int calcularIdadehumana();
}

//herança, a class cachorro vai herdar tds as caracteristicas de um animal
class Cahorro extends Animal {
  @override
  int calcularIdadehumana(){
    if(idade != null){
      return idade! * 7;
    }
    return 0;
  }
}

class Pessoa2{
  String? nome;
  //Composição
  //quando 1 atributo de associação é obrigatório
  //nos estamos falando de composição
  Endereco endereco = Endereco();

  //agregação
  //quando um atributo de associação nao é obrigatorio
  //nos estamos falando de agregação
  Telefone? telefone;
}
class Endereco{}
class Telefone{}

//polimorfismo 
//varias classe tem uma caracteristica em comum

//Interface não temos métodos implementaddos
abstract class Carro{
  abstract int portas;
  abstract int rodas;
  abstract String motor;
  
  int velocidadeMax();

}

class Gol extends Carro{
  @override
  int portas = 4;
  @override
  int rodas = 4;
  @override
  String motor = '2.0';
  
  int velocidadeMax(){
    return 200;
  }
}

//mixins
abstract class Artista{
  String habilidade(){
    return 'artista geral';
  }
}

//maneira 1 
mixin Dancar on Artista{
  String dancar(){
    return 'dança Forro';
  }

  //sobreescreveu a habilidade do artista
  @override
  String habilidade(){
    return 'Dançar';
  }
}

//maneira 2 usando abstrac (mas no meu n funcuionou)
mixin Cantar on Artista{
    String cantar(){
    return 'canta Rock';
  }
}

class Joao extends Artista with Dancar, Cantar{}

class Pessoa3{
  String? nome;
  String? email;
  String? site;
}


//operator methods
class Numeros{
  int i;
  Numeros(this.i);

  Numeros operator + (Numeros numero2){
    return Numeros((i + numero2.i) * 2);
  }
}


class Cliente2{
  String? nome;
  String? cpf;

  String? razao;
  String? cnpj;

  Cliente2({
    this.nome,
    this.cpf,
    this.razao,
    this.cnpj
  }) : assert ((cpf != null) ? nome != null && razao == null && cnpj == null : true, 'vc ja enviou cpf junto com cnpj');
}


class Pessoa4{
  //constante n pode usar 'late'
  final String nome;
  final int idade;
  const Pessoa4({
    required this.nome,
    required this.idade
  });
}