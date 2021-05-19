import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter_icons/flutter_icons.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Door Lock',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Door Lock'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  Future<void> lock() async {
    var response = await http.get(Uri.parse('http://192.168.1.103/lock'));
    print(response);
  }
  Future<void> unlock() async {
    var response = await http.get(Uri.parse('http://192.168.1.103/unlock'));
    print(response);
  }

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
            RaisedButton.icon(
              icon: Icon(MaterialIcons.lock),
                label: Text("Lock"),
                elevation: 5.0,
                onPressed: (){
                  widget.lock();
                },
                splashColor: Colors.red,
            ),
            SizedBox(height: 20,),
            RaisedButton.icon(
              icon: Icon(MaterialIcons.lock_open),
                label: Text("Unlock"),
                elevation: 5.0,
                onPressed: (){
                widget.unlock();
                },
                splashColor: Colors.green,
            ),
          ],

        ),
      ),
    );
  }
}
