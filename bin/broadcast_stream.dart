import 'dart:async';

Stream<int> createNumberStream(int last) async* {
  for (int i = 1; i <= last; i++) {
    yield i;
  }
}

main() async {
  var stream = createNumberStream(5);
  var bStream = stream.asBroadcastStream();

  if(bStream.isBroadcast) {
    print("Broadcast Stream");
  } else {
    print("Single Stream");
  }

  bStream.first.then((x) => print("First event: $x"));

  bStream.last.then((x) => print("Last event: $x"));

  bStream.length.then((x) => print("Length of Stream: $x"));

  bStream.isEmpty.then((x) => print("Is Empty: $x"));

  stream = createNumberStream(0);
  bStream = stream.asBroadcastStream();
  bStream.isEmpty.then((x) => print("Is Empty: $x"));
}