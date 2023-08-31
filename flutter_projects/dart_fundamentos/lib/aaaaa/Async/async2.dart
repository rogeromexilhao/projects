Future<void> main()async{
  try{
    final id = await buscarId();
    final nome = await buscarNome(id);
    print('nome é $nome');
  }catch(e){
    print('deu ruim');
  }
}


Future<int> buscarId() async => 80;
Future<String> buscarNome(int id)async{
  //throw Exception();
  return 'roger';
}