// declarar uma classe 
class Camiseta{
  //atributos de instancia 
  String? tamanho;
  String? _cor; //esse atributo ficou privado
  String? marca;

  //info que não muda info statica
  //atributos de classe

  //static String nome = 'camiseta';
  static const String nome = 'camiseta'; //dessa forma n temos a alteraçãodo valor

  //metodos de classe
  static String recuperarnome() =>  nome;

  //são chamados de métodos de instancia
  String? lavagem(){
    if (marca == 'nike'){
      return 'nao pode lavar na maquinja';
    }else{
      return 'pode lavar na maquinja';
    }
  }

  String? get cor => _cor;
  set cor(String? cor){
    if(cor == 'Verde'){
      throw Exception('não pode ser verder');
    }
  }
}