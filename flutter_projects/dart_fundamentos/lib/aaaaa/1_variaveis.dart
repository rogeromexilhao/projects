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
}