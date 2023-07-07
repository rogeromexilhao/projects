void main(){

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
}