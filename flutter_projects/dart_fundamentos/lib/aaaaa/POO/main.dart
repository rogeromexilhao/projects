import 'classes.dart';

void main(){
  var camisetanNike = Camiseta();
  camisetanNike.tamanho = 'G';
  camisetanNike.cor = 'preta';
  camisetanNike.marca = 'nike';

  print(camisetanNike.tamanho);
  print(camisetanNike.cor);
  print(camisetanNike.marca);
  print(camisetanNike.lavagem());
}