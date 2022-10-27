import 'package:flutter/material.dart';
import 'package:nextparty/menu/party_view.dart';

class Parties extends StatefulWidget {
  const Parties({super.key});
  @override
  State<Parties> createState() => PartiesStateful();
}

class PartiesStateful extends State<Parties> {
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
                      ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: <Widget>[
                          Container(
                            child: Card(
                              elevation: 5,
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 20, 10, 20),
                                child: ListTile(
                                  title: const Text(
                                    'Fiesta de Jhon',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff2699FB)),
                                  ),
                                  subtitle: const Text(
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque eget enim elit. Aliquam interdum ultricies ipsum et sodales. Pellentesque ut massa sed ipsum luctus gravida. Donec sed ex at lectus semper interdum. ',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xff2699FB)),
                                  ),
                                  trailing: const Text(
                                    '29/10/2022',
                                    style: TextStyle(
                                        fontSize: 16, color: Color(0xff2699FB)),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Party()),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ))),
        ));
  }
}
