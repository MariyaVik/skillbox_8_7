import 'dart:math';

import 'package:flutter/material.dart';

class StreamFutureScreen extends StatefulWidget {
  StreamFutureScreen({Key? key}) : super(key: key);

  @override
  _StreamFutureScreenState createState() => _StreamFutureScreenState();
}

class _StreamFutureScreenState extends State<StreamFutureScreen> {
  bool isRandonGenerated = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Future / Stream'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Future builder'),
                Center(
                    //
                    // TODO: FutureBuilder
                    //
                    ),
              ],
            ),
          ),
          Divider(height: 20, thickness: 4),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Stream builder'),
                Center(
                    //
                    // TODO: StreamBuilder
                    //
                    ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // rebuild widget
          setState(() {});
        },
        tooltip: 'Increment',
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}

Stream<int> dataStream(int count) async* {
  var random = Random();
  while (count > 0) {
    int rand = random.nextInt(100);
    if (rand < 20) {
      throw 'Ошибка, число меньше 20';
    } else {
      count = count - 1;
      await Future.delayed(Duration(seconds: 1));
      yield rand;
    }
  }
}

Future<String> dataFuture() async {
  var random = Random();
  final response = await Future.delayed(Duration(seconds: 1), () {
    final isSuccess = random.nextBool();
    return isSuccess;
  });
  if (response) {
    return 'Данные успешно получены';
  } else {
    throw 'Ошибка загрузки данных';
  }
}
