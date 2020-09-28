import 'package:pubnub/pubnub.dart';
import 'dart:async';

void mainfd() async {
  // final pubnub = PubNub(
  //   defaultKeyset: Keyset(
  //     subscribeKey: 'sub-c-49e638da-f760-11ea-ae2d-56dc81df9fb5',
  //     publishKey: 'pub-c-41fafdf5-5a8b-4639-9823-ab987407a32b',
  //     uuid: UUID('MY_UUID'),
  //   ),
  // );

  var pubnub = PubNub(
    defaultKeyset: Keyset(
      subscribeKey: 'sub-c-49e638da-f760-11ea-ae2d-56dc81df9fb5',
      publishKey: 'pub-c-41fafdf5-5a8b-4639-9823-ab987407a32b',
      uuid: UUID('demo'),
    ),
  );

  // Subscribe to a channel
  var subscription = await pubnub.subscribe(channels: {'test-pnpres'});

  // Publish a message
  await pubnub.publish('test', {'message': 'My message!'});

  // Unsubscribe
  // await subscription.dispose();

  // Channel abstraction for easier usage
  var channel = pubnub.channel('test');

  await channel.publish({'message': 'Another message'});

  // Work with channel History API
  var history = channel.messages();
  var count = await history.count();

  // printing the number of messages in the channel
  print('Messages on test channel: $count');

  // will this work ??
  subscription.messages.listen(
    (event) {
      print(event.payload);
    },
    onError: (err) {
      print('Error! WTF is happening');
    },
    cancelOnError: false,
    onDone: () {
      print('stream has stopped');
    },
  );
}
