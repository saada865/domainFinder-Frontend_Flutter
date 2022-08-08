import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;

class scraperFinal extends StatefulWidget {
  const scraperFinal({Key? key}) : super(key: key);

  @override
  State<scraperFinal> createState() => _scraperFinalState();
}

//var title;

class _scraperFinalState extends State<scraperFinal> {
  //List<String> words = List();
  //String url = 'https://arprogramming.blogspot.com/';
  String url = 'https://pub.dev/packages/beautiful_soup_dart/example';

  void _getData() async {
    final response = await http.get(Uri.parse(url));
    dom.Document document = parser.parse(response.body);
    final elements =
        //document.getElementsByClassName('pkg-page-title-copy-feedback');
        document.getElementsByClassName('pkg-page-title-copy');
    final title = elements.map((element) => element.getElementsByTagName("a"));

    print("title is ");
    print(title);
  }

  @override
  void initState() {
    // TODO: implement initState
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
