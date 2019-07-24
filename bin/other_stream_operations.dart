import 'dart:async';

Stream<int> createNumberStream(int last) async* {
  for (int i = 1; i <= last; i++) {
    yield i;
  }
}

main() async {
  var stream = createNumberStream(5);
  stream.first.then((x) => print("First event: $x"));

  stream = createNumberStream(5);
  stream.last.then((x) => print("Last event: $x"));

  stream = createNumberStream(5);
  stream.length.then((x) => print("Length of Stream: $x"));

  stream = createNumberStream(5);
  stream.isEmpty.then((x) => print("Is Empty: $x"));

  stream = createNumberStream(0);
  stream.isEmpty.then((x) => print("Is Empty: $x"));
}