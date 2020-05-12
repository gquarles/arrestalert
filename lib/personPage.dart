import 'package:arrestalert/api/recentArrests.dart';
import 'package:arrestalert/widgets/personWidget.dart';
import 'package:flutter/material.dart';

import 'models/jail.dart';
import 'models/person.dart';

class PersonPage extends StatefulWidget {
  PersonPage({Key key, this.jail}) : super(key: key);

  final Jail jail;

  @override
  _PersonPageState createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  List<Person> people = new List<Person>();
  bool loaded = false;

  @override
  void initState() {
    fetchArrests();

    super.initState();
  }

  void fetchArrests() async {
    RecentArrests recentArrests = new RecentArrests();
    List<Person> people = await recentArrests.fetch(widget.jail.id);
    
    if (this.mounted) {
      setState(() {
        loaded = true;
        people = people;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.jail.name} Arrests'),
      ),
      body: Container(
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            PersonWidget(
              person: Person(
                  '',
                  'Arrest Inmate',
                  'https://imgstore.jailbase.com/small/arrested/ky-fcrj/2020-05-11/billy-joe-purvis-2010038178.pic1.jpg',
                  '',
                  2,
                  List<String>()),
            ),
          ],
        ),
      ),
    );
  }
}
