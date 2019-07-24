import 'dart:async';

Stream<int> createNumberStream(int last) async* {
  for (var i = 0; i< last; i++) {
    yield i;
  }
}

Future<int> addEvent(Stream<int> stream) async {
  var total = 0;
  await for (var num in stream) {
    total += num;
  }

  return total;
}

main() async {
  var stream = createNumberStream(5);
  var total = await addEvent(stream);
  print(total);
}
