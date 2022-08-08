import 'package:flutter/material.dart';
import 'package:frontend/apiCaller.dart';
import 'package:url_launcher/url_launcher.dart';

class Browser extends StatefulWidget {
  const Browser({Key? key}) : super(key: key);

  @override
  State<Browser> createState() => _BrowserState();
}

class _BrowserState extends State<Browser> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ElevatedButton(
            child: Text("Open Url"),
            onPressed: () async {
              ApiService();
              final url =
                  'https://pk.godaddy.com/domainsearch/find?checkAvail=1&tmskey=1dom_03_godaddyb&domainToCheck=fresh22mike.com';

              await launch(
                url,
                forceSafariVC: false,
              );
            }
            //},
            ));
  }
}
