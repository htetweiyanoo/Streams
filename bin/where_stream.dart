import 'dart:async';

Stream<int> createNumberStream(int last) async* {
  for (int i = 1; i <= last; i++) {
    yield i;
  }
}

main() async {
  var stream = createNumberStream(5);

  stream.where((x) => x > 3).listen((x) => print(x));
}
