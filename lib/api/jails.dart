import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:arrestalert/models/jail.dart';

class Jails {

  //Api endpoint
  var url = 'http://www.JailBase.com/api/1/sources/';

  //Returns list of all jails
  Future<List<Jail>> fetch() async {
    print('Reaching out to api...');
    final response = await http.get(url);
    print(response.statusCode);

    if (response.statusCode != 200) return new List<Jail>();

    final jails = json.decode(response.body);

    List<Jail> jailList = new List<Jail>();

    for (var u in jails['records']) {
      //Create a new jail object and populate from json response
      Jail jail = new Jail(u['source_id'], u['name'], u['state'], u['state_full'], u['has_mugshots']);
      jailList.add(jail);
    }

    return jailList;
  }

}