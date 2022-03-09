import 'package:flutter/material.dart';
import 'package:skillbox_8_7/fetch_file.dart';

class CatchErrorScreen extends StatefulWidget {
  CatchErrorScreen({Key? key}) : super(key: key);

  @override
  _CatchErrorScreenState createState() => _CatchErrorScreenState();
}

class _CatchErrorScreenState extends State<CatchErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catch error'),
      ),
      body: FutureBuilder<String>(
        future: fetchFileFromAssets('assets/text2.txt'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Center(
                child: Text('NONE'),
              );
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              return SingleChildScrollView(child: Text(snapshot.data));
            default:
              return SingleChildScrollView(
                child: Text('Default'),
              );
          }
        },
      ),
    );
  }
}
