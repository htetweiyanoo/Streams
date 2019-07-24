import 'dart:async';

Stream<int> createNumberStream(int last) async* {
  for (var i = 0; i < last; i++) {
    yield i;
  }
}

Future<void> printStream(Stream<int> stream) async {
  await for (var num in stream) {
    print(num);
  }
}

main() async {
  var stream = createNumberStream(5);
  printStream(stream);
}
