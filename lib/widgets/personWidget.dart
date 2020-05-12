import 'package:arrestalert/models/person.dart';
import 'package:arrestalert/widgets/mugshot.dart';
import 'package:flutter/material.dart';

class PersonWidget extends StatelessWidget {
  const PersonWidget({Key key, this.person}) : super(key: key);

  final Person person;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Mugshot(mugshot: person.mugshot,),
    );
  }
}