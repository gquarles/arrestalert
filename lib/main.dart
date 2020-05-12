import 'package:arrestalert/api/recentArrests.dart';
import 'package:arrestalert/widgets/personWidget.dart';
import 'package:flutter/material.dart';
import 'api/jails.dart';
import 'models/person.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Arrest Alert'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

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
            PersonWidget(person: Person('', 'Arrest Inmate', 'https://imgstore.jailbase.com/small/arrested/ky-fcrj/2020-05-11/billy-joe-purvis-2010038178.pic1.jpg', '', 2, List<String>()),),
          ],
        ),
      ),
    );
  }
}
