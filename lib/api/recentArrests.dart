import 'dart:async';
import 'dart:convert';
import 'package:arrestalert/models/person.dart';
import 'package:http/http.dart' as http;

class RecentArrests {

  Future<List<Person>> fetch(String id) async {
    //Api endpoint
    final String url = 'https://www.jailbase.com/api/1/recent/?source_id=$id';
    print('Reaching out to api...');
    final response = await http.get(url);
    print(response.statusCode);

    //If api returns not okay
    if (response.statusCode != 200) return new List<Person>();

    final people = json.decode(response.body);

    List<Person> personList = new List<Person>();
    for (var u in people['records']) {
      //Make a list of charges because API is weird sometimes
      List<String> charges = new List<String>();
      for (String charge in u['charges']) {
        charges.add(charge);
      }
      
      Person person = new Person(u['book_date_formatted'], u['name'], u['mugshot'], u['more_info_url'], u['id'], charges);
      personList.add(person);
    }
    return personList;
  }
}