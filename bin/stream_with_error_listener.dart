import 'dart:async';

import 'dart:math';

Stream<int> createNumberStream(int last) async* {
  for (var i = 0; i < last; i++) {
    if (i == 5) {
      throw Exception("Demo Exception when accessing 5th number");
    }
    yield i;
  }
}

Future<int> addEvent(Stream<int> stream) async {
  var total = 0;
  try {
    await for (var num in stream) {
      total += num;
    }
  } catch (e) {
    return -1;
  }
  return total;
}

main() async {
  var stream = createNumberStream(6);
  stream.listen(
      (x) => print("num : $x"),
      onError: (err) => print("error : $err"),
      onDone: () => print("finished")
  );
}
