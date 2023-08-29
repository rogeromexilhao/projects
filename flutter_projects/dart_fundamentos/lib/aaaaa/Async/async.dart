import 'dart:async';

void main(){

  /*
  Future
  var valor = Future(() {
    //função asinc
  }).then((value){
    //registrando função que sera executada quando o futuro for completado com sucesso
  }).catchError((error){
    //registrando função quando sera executado queno o futuro for completado com erro
  }).whenComplete((){
    //registrando a função que sera executada sempre (erro ou secesso)
  });

  */


  Future<int>((){
    return 10~/2;
  }).then((valorOrcamento){
    print('orçamento é de $valorOrcamento reais'); 
  });

  Future<String>((){
    throw Exception('aviao foi de japa');
    return 'comprado';
  }).then((valorOrcamento){
    print('deu bom'); 
  }).catchError((error){
    print('deu ruim!!');
  }).whenComplete(() => print('finalizado'));


  Future<int>((){
    return 20~/2;
  }).then((value) => 
    print('valor calculado $value'
    ));
}