import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateParty extends StatelessWidget {
  const CreateParty({Key? key}) : super(key: key);

  static const OutlineInputBorder myInputBorder = OutlineInputBorder(
      borderSide: BorderSide(
    color: Color(0xffBCE0FD),
    width: 3,
  ));
  Duration get loginTime =>
      const Duration(milliseconds: 2250); // 2.25 seconds to wait

  @override
  Widget build(BuildContext context) {
    TextEditingController partyNameController = TextEditingController();
    TextEditingController partyDescriptionController = TextEditingController();
    TextEditingController dateController = TextEditingController();
    TextEditingController locationController = TextEditingController();

    return Scaffold(
        backgroundColor: Colors.white,
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(color: Color(0xffBCE0FD)),
                child: Text('Drawer Header',
                    style: TextStyle(color: Color(0xff2699FB))),
              ),
              ListTile(
                title: const Text(
                  'Create Party',
                  style: TextStyle(color: Color(0xff2699FB)),
                ),
                onTap: () {},
              ),
              ListTile(
                title: const Text(
                  'My Parties',
                  style: TextStyle(color: Color(0xff2699FB)),
                ),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu, color: Color(0xff2699FB)),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
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
                            Text("Create your next party",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff2699FB))),
                            Text("Fill in the details below",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Color(0xff2699FB))),
                          ],
                        ),
                      ),
                      Container(height: 20),
                      Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                            child: TextField(
                              controller: partyNameController,
                              decoration: const InputDecoration(
                                prefixIcon:
                                    Icon(Icons.cake, color: Color(0xffBCE0FD)),
                                border: myInputBorder,
                                enabledBorder: myInputBorder,
                                focusedBorder: myInputBorder,
                                labelText: 'Name of the event',
                                labelStyle: TextStyle(
                                    color: Color(0xffBCE0FD), fontSize: 16),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                            child: TextField(
                              controller: partyDescriptionController,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.description,
                                    color: Color(0xffBCE0FD)),
                                border: myInputBorder,
                                enabledBorder: myInputBorder,
                                focusedBorder: myInputBorder,
                                labelText: 'Add a description',
                                labelStyle: TextStyle(
                                    color: Color(0xffBCE0FD), fontSize: 16),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                            child: TextField(
                              controller: dateController,
                              readOnly: true,
                              decoration: const InputDecoration(
                                border: myInputBorder,
                                enabledBorder: myInputBorder,
                                focusedBorder: myInputBorder,
                                prefixIcon: Icon(Icons.calendar_today,
                                    color: Color(0xffBCE0FD)),
                                labelText: 'Date',
                                labelStyle: TextStyle(
                                    color: Color(0xffBCE0FD), fontSize: 16),
                              ),
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(0),
                                    lastDate: DateTime(2101));
                                dateController.text = DateFormat('dd/MM/yyyy')
                                    .format(pickedDate!)
                                    .toString();
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                            child: TextField(
                              controller: locationController,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.location_on,
                                    color: Color(0xffBCE0FD)),
                                border: myInputBorder,
                                enabledBorder: myInputBorder,
                                focusedBorder: myInputBorder,
                                labelText: 'Location',
                                labelStyle: TextStyle(
                                    color: Color(0xffBCE0FD), fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(height: 30),
                      Container(
                          width: double.infinity,
                          child: ElevatedButton(
                            child: const Text('Create Party',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16)),
                            onPressed: () {},
                          )),
                    ],
                  ))),
        ));
  }
}
