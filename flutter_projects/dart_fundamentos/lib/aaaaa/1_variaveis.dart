void main(){
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

}