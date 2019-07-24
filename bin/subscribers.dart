import 'dart:async';

Stream<int> createNumberStream(int last) async* {
  for (int i = 1; i <= last; i++) {
    if (i == 5) {
      throw Exception(
        "Demo exception when access 5th number"
      );
    }
    yield i;
  }
}


Future<int> addEvents(Stream<int> stream) async {
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
  var stream = createNumberStream(5);

  var subscription = stream.listen(null);
  subscription.onData((x) => print("number $x"));
  subscription.onError((err) => print("error : $err"));
  subscription.onDone(() => print("finished"));
}