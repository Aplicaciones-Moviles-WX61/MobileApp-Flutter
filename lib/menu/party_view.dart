import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Party extends StatefulWidget {
  const Party({super.key});

  @override
  State<Party> createState() => PartyStateful();
}

class PartyStateful extends State<Party> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 12.0),
                  child: Column(
                    children: <Widget>[],
                  ))),
        ));
  }
}
