import 'package:flutter/material.dart';
import 'package:skillbox_8_7/fetch_file.dart';

class LoadFileScreen extends StatefulWidget {
  final String title;

  LoadFileScreen({Key? key, required this.title}) : super(key: key);

  @override
  _LoadFileScreenState createState() => _LoadFileScreenState();
}

class _LoadFileScreenState extends State<LoadFileScreen> {
  final _showFileController = TextEditingController();
  String _fileName = 'assets/text2.txt';

  void _showFile() {
    _fileName = 'assets/' + _showFileController.text + '.txt';
    setState(() {});
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
            child: SizedBox(
              height: 60,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      minLines: null,
                      maxLines: null,
                      expands: true,
                      controller: _showFileController,
                      decoration: InputDecoration(
                        hintText: 'Введите название файла',
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
                  LayoutBuilder(
                      builder: (BuildContext ctx, BoxConstraints constraints) {
                    return SizedBox(
                      height: constraints.maxHeight,
                      child: ElevatedButton(
                        onPressed: _showFile,
                        child: Text('Найти'),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            )))),
                      ),
                    );
                  }),
                ],
              ),
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
