import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Parties extends StatefulWidget {
  const Parties({super.key});

  @override
  State<Parties> createState() => PartiesStateful();
}

class PartiesStateful extends State<Parties> {
  static const OutlineInputBorder myInputBorder = OutlineInputBorder(
      borderSide: BorderSide(
    color: Color(0xffBCE0FD),
    width: 3,
  ));
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const n = 0;
  @override
  Widget build(BuildContext context) {
    TextEditingController partyNameController = TextEditingController();
    TextEditingController partyDescriptionController = TextEditingController();
    TextEditingController dateController = TextEditingController();
    TextEditingController locationController = TextEditingController();

    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box, color: Colors.white70),
              activeIcon: Icon(Icons.add_box, color: Colors.white),
              backgroundColor: Color(0xff2699FB),
              label: 'Create Party',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt, color: Colors.white70),
              activeIcon: Icon(Icons.list_alt, color: Colors.white),
              backgroundColor: Color(0xff2699FB),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.white70),
              activeIcon: Icon(Icons.search, color: Colors.white),
              backgroundColor: Color(0xff2699FB),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.white70),
              activeIcon: Icon(Icons.person, color: Colors.white),
              backgroundColor: Color(0xff2699FB),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings, color: Colors.white70),
              activeIcon: Icon(Icons.settings, color: Colors.white),
              backgroundColor: Color(0xff2699FB),
              label: 'Settings',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          showSelectedLabels: false,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back_ios_rounded,
                    color: Color(0xff2699FB)),
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
              );
            },
          ),
          centerTitle: true,
          title: const Text(
            'PARTIES',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff2699FB),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
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
                                    'Party Name',
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
                                    '01/01/2023',
                                    style: TextStyle(
                                        fontSize: 16, color: Color(0xff2699FB)),
                                  ),
                                  onTap: () {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           const Parties()),
                                    // );
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
