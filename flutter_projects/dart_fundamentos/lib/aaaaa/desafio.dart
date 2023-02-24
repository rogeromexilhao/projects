void main() {

  //! Detalhe sobre a String
  //! A String é composta por 4 campos (Nome|Idade|Profissão|Estado onde mora)
  final pacientes = [
    'Rodrigo Rahman|35|desenvolvedor|SP',
    'Manoel Silva|12|estudante|MG',
    'Joaquim Rahman|18|estudante|SP',
    'Fernando Verne|35|estudante|MG',
    'Gustavo Silva|40|desenvolvedor|MG',
    'Sandra Silva|40|desenvolvedor|MG',
    'Regina Verne|35|dentista|MG',
    'João Rahman|55|jornalista|SP',
  ];

  //! Baseado no array acima monte um relatório onde:
  //! 1 - Apresente os pacientes com mais de 20 anos e print o nome deles
  //! 2 - Apresente quantos pacientes existem para cada profissão (desenvolvedor, estudante, dentista, jornalista)
  //! 3 - Apresente a quantidade de pacientes que moram em SP

  var contDev = 0;
  var contEst = 0;
  var contDents = 0;
  var contJor = 0;
  var contSP = 0;

  for (final paciente in pacientes){

    var paciente_aux = paciente.split('|');

    if (int.parse(paciente_aux[1]) >= 20){
      print('Nome: '+paciente_aux[0]);
      print('Idade: '+paciente_aux[1]);
      print(' ');
    }

    if(paciente_aux[2] == 'desenvolvedor'){
      contDev += 1;
    }else if(paciente_aux[2] == 'estudante'){
      contEst += 1;
    }else if(paciente_aux[2] == 'dentista'){
      contDents += 1;
    }else{
      contJor += 1;
    }

    if(paciente_aux[3] == 'SP'){
      contSP += 1;
    }

  }

  print(' --------------------- ');
  print(' ');

  print('qtd de devs: $contDev');
  print('qtd de estudantes: $contEst');
  print('qtd de dentistas: $contDents');
  print('qtd de devs: $contJor');

  print(' ');
  print(' --------------------- ');
  print(' ');

  print('qtd de pessoas que moram em SP: $contSP');    

}