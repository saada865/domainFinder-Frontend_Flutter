import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:frontend/apiCaller.dart';
import 'package:frontend/browser.dart';
import 'package:frontend/launcher.dart';
import 'package:google_fonts/google_fonts.dart';

import 'launcher_final.dart';
//saada865/Domain-Finder

class backG extends StatefulWidget {
  const backG({Key? key}) : super(key: key);

  @override
  State<backG> createState() => _backGState();
}

class _backGState extends State<backG> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurpleAccent[100],
      child: Column(
        children: [
          //SizedBox(height: 200),
          //scraperFinal(),
          //Browser(),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 280.0, 0.0),
            child: Container(
              height: 150,
              width: 150,
              //color: Colors.black,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/main_top.png"),
                ),
                //   color: Colors.green,
              ),
            ),
          ),
          Icon(
            Icons.zoom_in_rounded,
            size: 125,
          ),
          SizedBox(
            height: 50,
          ),
          Card(
            color: Colors.deepPurpleAccent[100],
            shadowColor: Colors.transparent,
            child: Padding(
                padding: const EdgeInsets.fromLTRB(75.0, 10, 20, 0),
                child:
                    // Card(
                    //color: Color.fromARGB(255, 60, 17, 82),
                    // child:
                    Text(
                  "Welcome To Domain Finder!",
                  //style: //TextStyle(
                  //color: Color.fromARGB(255, 140, 14, 203),
                  style: GoogleFonts.bebasNeue(
                      fontStyle: FontStyle.normal, fontSize: 50),

                  //fontSize: 38,
                  // ),
                  //),
                )),
          ),
          SizedBox(
            height: 50,
          ),
          ApiService(),
          // Container(
          //     height: 70,
          //     width: 220,
          //     decoration: BoxDecoration(
          //         color: Colors.grey[200],
          //         borderRadius: BorderRadius.circular(10)),
          //     child: TextButton(
          //       onPressed: () {},
          //       child: Text(
          //         "Press to get Domain Name",
          //         style: TextStyle(
          //           color: Colors.purple[300],
          //           fontSize: 15,
          //           //backgroundColor: Colors.purple
          //         ),
          //       ),
          //     ))
        ],
      ),
    );
  }
}
