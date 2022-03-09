import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:skillbox_8_7/fetch_file.dart';

class LoadFileScreen extends StatefulWidget {
  final String title;

  LoadFileScreen({Key? key, required this.title}) : super(key: key);

  @override
  _LoadFileScreenState createState() => _LoadFileScreenState();
}

class _LoadFileScreenState extends State<LoadFileScreen> {
  final GlobalKey _textFieldKey = GlobalKey();
  late double? _height = 50;
  final _showFileController = TextEditingController();
  String _fileName = 'assets/text2.txt';

  void _showFile() {
    _fileName = 'assets/' + _showFileController.text + '.txt';
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      _height = _textFieldKey.currentContext?.size?.height;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _showFileController,
                    key: _textFieldKey,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: _height,
                  child: ElevatedButton(
                    onPressed: _showFile,
                    child: Text('Найти'),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        )))),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: FutureBuilder<String>(
              future: fetchFileFromAssets(_fileName),
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
          ),
        ],
      ),
    );
  }
}
