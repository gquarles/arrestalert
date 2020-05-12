import 'package:arrestalert/models/person.dart';
import 'package:arrestalert/widgets/mugshot.dart';
import 'package:flutter/material.dart';

class PersonWidget extends StatelessWidget {
  const PersonWidget({Key key, this.person}) : super(key: key);

  final Person person;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 7,
        child: Container(
          padding: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Mugshot(
                  mugshot: person.mugshot,
                ),
              ),
              Container(
                child: Text(person.name),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
