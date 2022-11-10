import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nextparty/menu/party_view.dart';

import '../models/party.dart';
import '../services/party_service.dart';

class Parties extends StatefulWidget {
  const Parties({super.key});
  @override
  State<Parties> createState() => PartiesStateful();
}

class PartiesStateful extends State<Parties> {
  List<Party> parties = [];
  @override
  void initState() {
    super.initState();
    var x = PartyService().getParties();
    x.then((value) => setState(() {
          jsonDecode(value!).forEach((element) {
            parties.add(Party.fromJson(element));
          });
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 12.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: double.infinity,
                        height: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Text("Your Upcoming Events",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff2699FB))),
                            Text("select an event to view details",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Color(0xff2699FB))),
                          ],
                        ),
                      ),
                      Container(height: 20),
                      ListView.builder(
                        itemCount: parties.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          Party party = parties[index];
                          return Card(
                            elevation: 5,
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 20, 10, 20),
                              child: ListTile(
                                // contentPadding:
                                //     const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                title: Text(
                                  party.name,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff2699FB)),
                                ),
                                subtitle: Text(
                                  party.description,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: Color(0xff2699FB)),
                                ),
                                trailing: Text(
                                  DateFormat('dd/MM/yyyy')
                                      .format(DateTime.parse(party.date!))
                                      .toString(),
                                  style: const TextStyle(
                                      fontSize: 16, color: Color(0xff2699FB)),
                                ),
                                onTap: () async {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            PartyDetail(party: parties[index]),
                                      ));
                                },
                              ),
                            ),
                          );
                        },
                        // shrinkWrap: true,
                        // scrollDirection: Axis.vertical,
                      )
                    ],
                  ))),
        ));
  }
}
