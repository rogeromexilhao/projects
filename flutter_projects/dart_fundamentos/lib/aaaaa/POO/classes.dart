// declarar uma classe 
class Camiseta{
  //atributos
  String? tamanho;
  String? cor;
  String? marca;

  //são chamados de métodos
  String? lavagem(){
    if (marca == 'nike'){
      return 'nao pode lavar na maquinja';
    }else{
      return 'pode lavar na maquinja';
    }
  }
}