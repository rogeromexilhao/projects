//import 'caminho do arquivo.dart'
//e com isso é possivel importar a aruivo e chamar direto as funções que tem la

//outra maneira de importar é por package
//import 'package:';

void main(){

  // DART FUNÇÕES E COLEÇÕES ---------------------------------------------------------------------------------------------------------------

  //para fazer a função temos que passar o tipo dela como: int,void,double...

  int somarnumeros(){
    return 0;
  }

  //o required faz com que tenha obrigatoriamente passar um valor
  int somanumeros2({required int numero1}){
    return 0;
  }

  //tem como tb passar valores padroes
  int somanumeros3({int numero = 0}){
    return 0;
  }

  //tb dessa maneira é possivel ser opcional o valor passado onde podemos chamar a função passando nd ou passando alguma coisa
  //somanumeros4();
  //somanumeros4(1);
  int somanumeros4([int numero = 0]){
    return 0;
  }

  //e dessa maneira é possivel misturar tds os tipos dos paramentros

  //é possuivel tb funções arrow '=>' que são utilizadas quando a função pequenas
  int somanumeros5(int numero1, int numero2) => numero1+numero2;
  //dessa maneira vai ja retornar a soma de n1 + n2 com os numeros passados

  //isso é uma função anonima que pode ser atribuido numa variavel
  var slafuncao = (){
    print('função anonima');
    };

  slafuncao();

  //typedef seria uma 'função variavel'

  //.expand emmuma lisata vai juntar 2 listas diferentes
  //.any em uma lista é como se fosse o 'in' analisa se a condição é atendeida em pelo menos 1 elemento
  //.every em uma lista analisa a condição para tds os elementos da lista 
  //.sort vai ordenar a lista
  //junto com o .sort podemos usar o .compareTo


  var numerolista = <int?>[]; // vai criar uma lista permitindo null
  numerolista.add(1);
  numerolista.add(2);
  numerolista.add(3);
  numerolista.add(3);
  numerolista.add(null);
  numerolista.add(2);
  numerolista.add(1);

  print(numerolista);


  var numeroset = <int?>{}; // vai criar uma lista com valores diferentes permitindo null
  numeroset.add(1);
  numeroset.add(2);
  numeroset.add(3);
  numeroset.add(3);
  numeroset.add(null);
  numeroset.add(2);
  numeroset.add(1);

  print(numeroset);

  var numeros1 = {1,2,3,4,5};
  var numeros2 = {3,4,5,6};
  var numeros3 = [1,2,3,1];

  print(numeros1.difference(numeros2));
  print(numeros1.union(numeros2));
  print(numeros1.intersection(numeros2));
  print(numeros1.lookup(1));//procura na lista

  final paciente = <String,String>{
    'nome':'Rodrigo',
    'curso':'academia'
  };//dessa forma é map

  var produtos = <String,String>{};
  produtos.putIfAbsent('nome', () => 'cerveja');//isso so é possivel fazzr uma vez se a key n existir
  print(produtos);
  produtos.update('nome', (value) => 'refrigerante');
  print(produtos);

  print('nome do produto é ${produtos['nome']}'); // acessando a o valor de alguma key
  produtos.update('preço', (value) => '10', ifAbsent: () => '10');//se n existir uma key para fazer update cria e adiciona

  produtos.forEach((key, value) { 
    print('chave $key: $value');
  });

  //MapEntry pode ter um entry e um mapa


  /* isso vai ser criado um exception
  var idade = '38 anos';
  int.parse(idade);
  para resolver isso
  */ 
  var idade = '38 anos';
  String? nome;
  //podemos ter varios catch para tratar
  try{
    //int.parse(idade);
    nome!.toLowerCase();
  }on FormatException {//para erros expecificos e quando tratamos erros especificos podemos tirar o catch
    print('executa o codigo de tratamento de erro da idade');
  }catch(e,s){//para outros erros
    print('pipocou o programa');
    //print(e); printa o erro 
    print(s);//o 's' (stack3) mostra onde que ocorreu o problema e ao clicar no console ele vai para linha que deu o problema, ou seja deixa deixa o erro rastreavel
  }finally{
    print('vai executar de td jeito msm dando erro ou não');
  }
  

  /*
  importação relativa -> import 'normal' passando caminho etc...
  importação de pacotes(packeges) -> importar pastas
  lint -> define umas regras padrões 

  ambos os imports estão certos e errados de certa forma podendo ser usado as 2 formas no seu projeto
  vantagens de cada import 
  relativa:
  - nomes curtos e claros
  - fica claro que pertence as projeto e n a algum package
  - se vc mover a pasta pai n vai quebrar tds os imports da pasta

  pacotes:
  - vc sabe exatamente onde cada importaçõa está localizada em tds os detalhes

  qual usar ? -> isso fica a uma questão de gosto ambos são utilizados em varias empresas e varios locais
  */

  /*
  
  */




}