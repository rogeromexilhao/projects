void main(){
  // DART FUNDAMENTOS ---------------------------------------------------------------------------------------------------------------

  //int 
  int idade = 21;

  //float
  double valor = 10.000;

  //str
  String str = 'teste';

  //num pode ser qualquer numero
  num numero = 1;
  num numero2 = 1.5;

  //pode usar var direto
  var teste = 10;
  var teste2 = 'alo alo';

  //object pode ser td onde tds as outra variaveis são filhos de object
  /*
  object geralemnte usa para alguma coisa que vc n sabe o que vai receber
  */
  Object teste3 = 'qualquer coisa';

  //dynamic funciona da msm maneira que o object
  dynamic teste4 = 12312312;

  print(teste);

  //variaveis null
  //o dart nao aceita variaveis do tipo null normalmente por isso é necessario fazer isso...
  String? nome = null;
  //o '?' serve como ondicional pode ser null mas pode ser outro valor
  print(nome);

  //o final faz com que o valor que esta setado n podera ser mais mudado no caso abaixo vai ser semre Rodrigo lago 
  //e nao podera ser alterado futuramente vai torna la imutavel 
  final nome2 = 'Rodrigo lago';
  print(nome2);

  //o const tb torna a variavel imutavel porem ela tem uma particulariedade que é a variavel deve ser reconhecida antes da compilação
  const nomeconst = 'teste de nome';
  //se fizermos o caso abaixo temos um erro
  //const teste = numero;

  //if else else if suas declarações são iguais ao javascript
  if (idade >= 18){
    print('mior de 18');
  }else{
    print('menor de 18');
  }

  //codição ternario (in line) igual do react
  final miordeidade = (idade >= 18 ? true : false);
  print(miordeidade);
  
  
  //switch case
  var cont = 2;
  switch(cont){
    case 0:
      print('case 0');
      break;
    case 1:
      print('case 1');
      break;
    default:
      print('nada');
      break;
  }

  //list
  var numeros = [1,2,3,4];
  print(numeros);
  numeros.add(5);
  print(numeros);
  numeros.insert(0,6);
  print(numeros);
  numeros.remove(6);
  print(numeros);

  //gera listas 'automaticas'
  final numerosgerados = List.generate(10, (index) => index+1);
  print(numerosgerados);

  //fez a soma da lista inteira 
  var soma = numerosgerados.fold<int>(0,((previousValue, numero) => previousValue = previousValue+numero));
  print(soma);

  //facilita para fazer listas dependerem das outras
  var lista1 = [4,5,6];
  var lista2 = [1,2,...lista1];
  print(lista2);

  var listaints = [1,2,3];
  var listaSTR = [
    for(var i in listaints)'alo $i'
  ];
  print(listaSTR);


  //o continue é igual o pass do python

  //ver a parte do while certinho mas é parecido com tds os whiles que eu ja vi nd fora do normal
  //os iterables tem que transformar eles novamente a uma lista com o .toList()


  print(nome2.substring(0,5));

  print(nome2.startsWith('R'));

  print(nome2.toLowerCase());

  print(nome2.startsWith('R'));

  print(nome2.contains('lago'));

  //a interpolação de string é igual a do python ou com o $variavel que é mais viavel utilizar dessa maneira
  //e para ter um bloco de codigo na strig usamos {}

  print(nome2.split(' '));

  print(nome2.split(' ').last);

  //variavel.roud(); arredondamento para int
  //variavel.roudToDobble(); arredondamento para doble
  //variavel.toStringAsFixed(2) arredondamento de casa

  //int.parse para passar str para int e da msm fora o doble

}