import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:frontend/apiCaller.dart';
import 'package:google_fonts/google_fonts.dart';

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
      child: SingleChildScrollView(
        child: Column(
          children: [
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
                ),
              ),
            ),
            Icon(
              Icons.zoom_in_rounded,
              size: 125,
            ),
            Card(
              color: Colors.deepPurpleAccent[100],
              shadowColor: Colors.transparent,
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(75.0, 10, 20, 0),
                  child: Text(
                    "Welcome To Domain Finder!",
                    style: GoogleFonts.bebasNeue(
                        fontStyle: FontStyle.normal, fontSize: 50),
                  )),
            ),
            SizedBox(
              height: 50,
            ),
            ApiService(),
          ],
        ),
      ),
    );
  }
}
