import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    }
    var element = getrandomElement(justNames);
    key = element;
    method();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      color: Colors.deepPurpleAccent[100],
      child: Column(
        children: [
          Container(
            height: 45,
            width: 200,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 150, 85, 181),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: myCont,
              decoration: InputDecoration(border: InputBorder.none),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 40,
            width: 200,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 150, 85, 181)),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.black)),
              child: Text(
                "GET DOMAIN",
                style: GoogleFonts.bebasNeue(
                    fontStyle: FontStyle.normal, fontSize: 25),
              ),
              onPressed: () {
                fetchNotes();
              },
            ),
          ),
        ],
      ),
    ));
  }
}
