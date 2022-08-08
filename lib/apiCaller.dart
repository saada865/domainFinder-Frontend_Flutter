import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import 'models/Name.dart';

class ApiService extends StatefulWidget {
  const ApiService({Key? key}) : super(key: key);

  @override
  State<ApiService> createState() => _ApiServiceState();
}

class _ApiServiceState extends State<ApiService> {
  static String _baseUrl = 'https://young-sea-46186.herokuapp.com/names/list';
  late List<Name> names;
  late List<String> justNames;
  var key;
  var siteName;
  var userName;
  var myCont = TextEditingController();

  method() async {
    //ApiService();
    var d = myCont.text;
    siteName = key + d;
    final url =
        "https://pk.godaddy.com/domainsearch/find?checkAvail=1&tmskey=1dom_03_godaddyb&domainToCheck=" +
            siteName +
            ".com";

    await launch(
      url,
      forceSafariVC: false,
    );
  }

  T getrandomElement<T>(List<T> listLocal) {
    final random = new Random();
    var num = random.nextInt(listLocal.length);
    return listLocal[num];
  }

  fetchNotes() async {
    names = [];
    justNames = [];

    Uri requestUri = Uri.parse(_baseUrl);
    var response = await http.get(requestUri);
    var decoded = jsonDecode(response.body);

    for (var nameMap in decoded) {
      Name newName = Name.fromMap(nameMap);
      names.add(newName);
      justNames.add(newName.name.toString());
      // print(newName.name.toString());
    }
    var element = getrandomElement(justNames);
    key = element;
    method();
    //return element;
    //print(decoded.toString());

    // List<Name> names = [];
    // for (var name in decoded) {
    //   print(name.toString());
    // }

    // Name names = decoded;
    // print(names.name.toString());
    //return names;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      color: Colors.deepPurpleAccent[100],
      child: Column(
        children: [
          Container(
            height: 40,
            width: 150,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 150, 85, 181)),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.black)),
              child: Text("GET DOMAIN"),
              onPressed: () {
                fetchNotes();
                //// print(dope);
                //print(element.toString());
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          // ignore: prefer_const_constructors
          // ElevatedButton(
          //   onPressed: method,
          //   child: Text("For webpage"),
          // ),
          Container(
            height: 50,
            width: 200,
            decoration: BoxDecoration(color: Color.fromARGB(255, 150, 85, 181)),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextField(
                controller: myCont,
              ),
            ),
          )
        ],
      ),
    ));
  }
}

// static String _baseUrl = 'https://young-sea-46186.herokuapp.com/';

//   static Future<void> get() async {
//     Uri requestUri = Uri.parse(_baseUrl + "/names/list");
//     var response = await http.post(requestUri);
//     var decoded = jsonDecode(response.body);
//     print("ANSWER");
//     print(decoded.toString());
