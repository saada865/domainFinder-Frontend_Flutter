import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;

class scraper extends StatefulWidget {
  const scraper({Key? key}) : super(key: key);

  @override
  State<scraper> createState() => _scraperState();
}

class _scraperState extends State<scraper> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getWebsiteData();
  }

  Future getWebsiteData() async {
    final url = Uri.parse('https://www.amazon.com/s?k=iphone'
        //final url = Uri.parse(
        //'https://ph.godaddy.com/domainsearch/find?checkAvail=1&domainToCheck=sooperKiller.com'
        //'https://ph.godaddy.com/domainsearch/find?checkAvail=1&domainToCheck=sooperKiller.com'
        );
    final response = await http.get(url);
    dom.Document html = dom.Document.html(response.body);

    final titles = html
        .querySelectorAll(''
            //'<span class="h3">Sorry, <span dir="ltr" class="text-primary">google.com</span> is unavailable</span>'
            )
        .map((element) => element.innerHtml.trim())
        .toList();

    print('Count: ${titles.length}');
    print(titles);
    //print(titles.toString());

    //for (final title in titles) {
    // debugPrint(title);
    //print("DOPE");
    //print(title);
    //}

    //var document = (response.body);
    //final titles = document;
    //html
    //print(document.toString());
    // .(
    //         '<span class="h3">Sorry, <span dir="ltr" class="text-primary">google.com</span> is unavailable</span>')
    //     .toString();

    //.map((e) => e.innerHtml.trim())
    //   .toList();

    //print(titles);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
          onPressed: () {
            getWebsiteData();
          },
          child: Container(
            color: Colors.red,
            child: Text("dope"),
          )),
    );
  }
}
