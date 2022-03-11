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
  final double _searchHeight = 60;
  final double padding = 8;

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
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                top: _searchHeight + 2 * padding,
                left: padding,
                right: padding),
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
          Padding(
            padding: EdgeInsets.all(padding),
            child: SizedBox(
              height: _searchHeight,
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
        ],
      ),
    );
  }
}
