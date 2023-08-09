void main() {
  
  //! Detalhe sobre a String
  //! A String é composta por 3 campos (Nome|Idade|Sexo)
  final pessoas = [
    'Rodrigo Rahman|35|Masculino',
    'Jose|56|Masculino',
    'Joaquim|84|Masculino',
    'Rodrigo Rahman|35|Masculino',
    'Maria|88|Feminino',
    'Helena|24|Feminino',
    'Leonardo|5|Masculino',
    'Laura Maria|29|Feminino',
    'Joaquim|72|Masculino',
    'Helena|24|Feminino',
    'Guilherme|15|Masculino',
    'Manuela|85|Feminino',
    'Leonardo|5|Masculino',
    'Helena|24|Feminino',
    'Laura|29|Feminino',
  ];

  //! Baseado na lista acima.
  //! 1 - Remova os pacientes duplicados e apresente a nova lista
  //! 2 - Me mostre a quantidade de pessoas por sexo (Masculino e Feminino) e depois me apresente o nome delas
  //! 3 - Filtrar e deixar a lista somente com pessoas maiores de 18 anos e apresente essas pessoas pelo nome 
  //! 4 - Encontre a pessoa mais velha e apresente o nome dela.

  final visualizados = [];
  final duplicadas = [];
  final masculino = [];
  final feminino = [];
  var qtdM = 0;
  var qtdF = 0;
  final maiores =[];
  var velho = 0;

  final listaSemDuplicatas = Set.from(pessoas).toList();

  print('Lista original: $pessoas');
  print(' ');
  print('Lista sem duplicatas: $listaSemDuplicatas');

  for (final verifica in pessoas){
    if (visualizados.contains(verifica)){
      duplicadas.add(verifica);
    }else{
      visualizados.add(verifica);
    }
  }


  for (final pessoa in listaSemDuplicatas){
    var pessoa_aux = pessoa.split('|');

    if(pessoa_aux[2] == 'Masculino'){
      qtdM += 1;
      masculino.add(pessoa_aux[0]);
    }else{
      qtdF += 1;
      feminino.add(pessoa_aux[0]);
    }

    if(int.parse(pessoa_aux[1]) >= 18){
      maiores.add(pessoa_aux[0]);
      if(int.parse(pessoa_aux[1]) > velho){
        velho = int.parse(pessoa_aux[1]);
        print('Nome + velho $pessoa_aux[0]');
      }
    }

  }

  print(' ');
  print('Lista das duplicatas: $duplicadas');
  print(' ');
  print('qnt masculino $qtdM');
  print('Nomes M $masculino');
  print(' ');
  print('qnt feminino $qtdF');
  print('Nomes F $feminino');
  print(' ');
  print('Maiores de 18 anos $maiores');

}