import 'package:flutter/material.dart';

class LoadFileScreen extends StatefulWidget {
  final String title;

  LoadFileScreen({Key? key, required this.title}) : super(key: key);

  @override
  _LoadFileScreenState createState() => _LoadFileScreenState();
}

class _LoadFileScreenState extends State<LoadFileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
    );
  }
}
