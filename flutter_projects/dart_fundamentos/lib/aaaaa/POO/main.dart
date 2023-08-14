import 'classes.dart';

void main(){
  var camisetanNike = Camiseta();
  camisetanNike.tamanho = 'G';
  camisetanNike.cor = 'Verde';
  camisetanNike.marca = 'nike';

  print(Camiseta.nome);
  print(Camiseta.recuperarnome());
  
  //Camiseta.nome = 'Camiseta nike'; se fizermos isso a partir desse ponto passamos o nome de 'camiseta' para 'Camiseta Nike' ate o fim da exec
  
  print(camisetanNike.tamanho);
  print(camisetanNike.cor);
  print(camisetanNike.marca);
  print(camisetanNike.lavagem());
}