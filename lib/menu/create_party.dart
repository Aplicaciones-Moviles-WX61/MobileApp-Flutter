import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nextparty/common/desing.dart';
import '../common/desing.dart';
import '../services/party_service.dart';

class CreateParty extends StatefulWidget {
  const CreateParty({super.key});

  @override
  State<CreateParty> createState() => CreatePartyStateful();
}

class CreatePartyStateful extends State<CreateParty> {
  PartyService service = PartyService();
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  TextEditingController partyNameController = TextEditingController();
  TextEditingController partyDescriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  createParty() async {
    var party = PartyDto(
        name: partyNameController.text,
        description: partyDescriptionController.text,
        location: locationController.text,
        date: DateFormat('yyyy-MM-dd')
            .format(DateTime.parse(dateController.text))
            .toString());
    var result = await service.createParty(party);
    if (result != null) {
      partyNameController.clear();
      partyDescriptionController.clear();
      dateController.clear();
      locationController.clear();
      showAboutDialog(
        context: context,
        children: [
          const Text('Se registro la fiesta correctamente'),
          const Text('Revisa tu lista de eventos'),
        ],
      );
    } else {
      showAboutDialog(
        context: context,
        children: [
          const Text('An error has occurred'),
          const Text('Try again'),
        ],
      );
    }
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
                              style: const TextStyle(color: Color(0xff2699FB)),
                              controller: partyNameController,
                              decoration: const InputDecoration(
                                prefixIcon:
                                    Icon(Icons.cake, color: Color(0xff2699FB)),
                                border: Design.myInputBorder,
                                enabledBorder: Design.myInputBorder,
                                focusedBorder: Design.myInputBorder,
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
                              style: const TextStyle(color: Color(0xff2699FB)),
                              controller: partyDescriptionController,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.description,
                                    color: Color(0xff2699FB)),
                                border: Design.myInputBorder,
                                enabledBorder: Design.myInputBorder,
                                focusedBorder: Design.myInputBorder,
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
                              style: const TextStyle(color: Color(0xff2699FB)),
                              controller: dateController,
                              readOnly: true,
                              decoration: const InputDecoration(
                                border: Design.myInputBorder,
                                enabledBorder: Design.myInputBorder,
                                focusedBorder: Design.myInputBorder,
                                prefixIcon: Icon(Icons.calendar_today,
                                    color: Color(0xff2699FB)),
                                labelText: 'Date',
                                labelStyle: TextStyle(
                                    color: Color(0xffBCE0FD), fontSize: 16),
                              ),
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1910),
                                    lastDate: DateTime(2101));
                                dateController.text = DateFormat('yyyy-MM-dd')
                                    .format(pickedDate!)
                                    .toString();
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                            child: TextField(
                              style: const TextStyle(color: Color(0xff2699FB)),
                              controller: locationController,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.location_on,
                                    color: Color(0xff2699FB)),
                                border: Design.myInputBorder,
                                enabledBorder: Design.myInputBorder,
                                focusedBorder: Design.myInputBorder,
                                labelText: 'Location',
                                labelStyle: TextStyle(
                                    color: Color(0xffBCE0FD), fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(height: 30),
                      SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            child: const Text('Create Party',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16)),
                            onPressed: () {
                              createParty();
                            },
                          )),
                    ],
                  ))),
        ));
  }
}
