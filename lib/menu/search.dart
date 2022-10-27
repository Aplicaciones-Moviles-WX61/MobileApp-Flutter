import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => SearchStateful();
}

class SearchStateful extends State<Search> {
  static const OutlineInputBorder myInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(
        color: Color(0xff7FC4FD),
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 12.0),
                  child: Column(
                    children: const <Widget>[
                      //Search bar
                      SizedBox(
                        height: 50,
                        child: TextField(
                          style: TextStyle(color: Color(0xff2699FB)),
                          decoration: InputDecoration(
                              border: myInputBorder,
                              enabledBorder: myInputBorder,
                              focusedBorder: myInputBorder,
                              prefixIcon:
                                  Icon(Icons.search, color: Color(0xff2699FB)),
                              hintText: 'Search',
                              hintStyle: TextStyle(color: Color(0xff2699FB))),
                        ),
                      ),
                    ],
                  ))),
        ));
  }
}
