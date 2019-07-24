Stream<int> createNumberStream(int last) async* {
  for (int i = 1; i <= last; i++) {
    yield i;
  }
}

main() async {
  var stream = createNumberStream(5);
  var bStream = stream.asBroadcastStream();

  bStream.take(2).listen((x) => print("take() : $x"));

  bStream.skip(2).listen((x) => print("skip() : $x"));

  bStream.takeWhile((x) => x>0 && x<3).listen((x) => print("takeWhile() : $x"));

  bStream.skipWhile((x) => x > 0 && x <3).listen((x) => print("skipWhile() : $x"));
}