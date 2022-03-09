import 'package:flutter/material.dart';
import 'package:skillbox_8_7/catch_error_screen.dart';
import 'package:skillbox_8_7/load_file_screen.dart';
import 'package:skillbox_8_7/stream_future_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: CatchErrorScreen(),
      home: LoadFileScreen(title: "Load file"),
      // home: StreamFutureScreen(),
    );
  }
}
