Future<void> main() async {

  final interval = Duration(seconds: 2);
  final stream = Stream<int>.periodic(interval,callback);

  await for(var i in stream){
    print(i);
  }

}

int callback(int value){
  return(value + 1) *2;
}