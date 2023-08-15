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