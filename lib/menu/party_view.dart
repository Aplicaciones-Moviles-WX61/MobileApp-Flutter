import 'package:flutter/material.dart';
import 'package:nextparty/common/desing.dart';
import 'item_detail.dart';

class PartyView extends StatefulWidget {
  const PartyView({super.key});

  @override
  State<PartyView> createState() => PartyStateful();
}

class PartyStateful extends State<PartyView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(color: Color(0xff2699FB)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '29/10/2022',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Fiesta de Jhon',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Las Adelfas Mz B 16, Surco 15023',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  //aca te quedaste
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                      bottom: 10, top: 10, left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('My Wishlist',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff2699FB),)),
                          TextButton(
                              onPressed: () {
                                Add_Item();
                              },
                              child: const Icon(Icons.add_shopping_cart, size: 30.0)),

                        ],
                      )
                    ],
                  )),
              Container(
                  height: 100,
                  margin: EdgeInsets.only(bottom: 5, top: 5),
                  padding: EdgeInsets.only(left: 25, right: 25),
                  child: InkWell(
                      child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xffBCE0FD),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding:
                              EdgeInsets.only(left: 20, top: 10, bottom: 10),
                          child: Row(
                            children: [
                              Container(
                                width: 50,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        // fit: BoxFit.cover,
                                        image: AssetImage(
                                            'assets/products/ron.png'))),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'Ron Cartavio (1L)',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Cantidad:   3 unidades',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                  //icons
                                  )
                            ],
                          )),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ItemDetail()));
                      })),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 500),
            child: FloatingActionButton(
              backgroundColor: Color(0xff2699FB),
              onPressed: () {
                OpenEditInfo();
              },
              tooltip: 'Editar Party',
              child: const Icon(Icons.edit),
            ),
          ),
          FloatingActionButton(
            backgroundColor: Color(0xff2699FB),
            onPressed: () {
              OpenGuestsList();
            },
            tooltip: 'Lista de invitados',
            child: const Icon(Icons.groups),
          ),
        ],
      ),
    );
  }

  Future OpenEditInfo() => showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Center(
            child: Text(
              'Edit Party',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff2699FB)),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                child: TextField(
                  style: TextStyle(color: Color(0xff2699FB)),
                  //controller: partyNameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.cake, color: Color(0xff2699FB)),
                    border: Design.myInputBorder,
                    enabledBorder: Design.myInputBorder,
                    focusedBorder: Design.myInputBorder,
                    labelText: 'Name of the event',
                    labelStyle:
                        TextStyle(color: Color(0xffBCE0FD), fontSize: 16),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                child: TextField(
                  style: TextStyle(color: Color(0xff2699FB)),
                  //controller: partyDescriptionController,
                  decoration: InputDecoration(
                    prefixIcon:
                        Icon(Icons.description, color: Color(0xff2699FB)),
                    border: Design.myInputBorder,
                    enabledBorder: Design.myInputBorder,
                    focusedBorder: Design.myInputBorder,
                    labelText: 'Add a description',
                    labelStyle:
                        TextStyle(color: Color(0xffBCE0FD), fontSize: 16),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                child: TextField(
                  style: const TextStyle(color: Color(0xff2699FB)),
                  //controller: dateController,
                  readOnly: true,
                  decoration: const InputDecoration(
                    border: Design.myInputBorder,
                    enabledBorder: Design.myInputBorder,
                    focusedBorder: Design.myInputBorder,
                    prefixIcon:
                        Icon(Icons.calendar_today, color: Color(0xff2699FB)),
                    labelText: 'Date',
                    labelStyle:
                        TextStyle(color: Color(0xffBCE0FD), fontSize: 16),
                  ),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1910),
                        lastDate: DateTime(2101));
                    //dateController.text = DateFormat('yyyy-MM-dd')
                    //.format(pickedDate!)
                    //.toString();
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                child: TextField(
                  style: TextStyle(color: Color(0xff2699FB)),
                  //controller: locationController,
                  decoration: InputDecoration(
                    prefixIcon:
                        Icon(Icons.location_on, color: Color(0xff2699FB)),
                    border: Design.myInputBorder,
                    enabledBorder: Design.myInputBorder,
                    focusedBorder: Design.myInputBorder,
                    labelText: 'Location',
                    labelStyle:
                        TextStyle(color: Color(0xffBCE0FD), fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel')),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Save')),
          ],
        );
      });

      Future Add_Item() => showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Center(
            child: Text(
              'Add Item',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff2699FB)),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                child: TextField(
                  style: TextStyle(color: Color(0xff2699FB)),
                  //controller: partyNameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.assessment_outlined, color: Color(0xff2699FB)),
                    border: Design.myInputBorder,
                    enabledBorder: Design.myInputBorder,
                    focusedBorder: Design.myInputBorder,
                    labelText: 'Name of the product',
                    labelStyle:
                    TextStyle(color: Color(0xffBCE0FD), fontSize: 16),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                child: TextField(
                  style: TextStyle(color: Color(0xff2699FB)),
                  //controller: partyDescriptionController,
                  decoration: InputDecoration(
                    prefixIcon:
                    Icon(Icons.description, color: Color(0xff2699FB)),
                    border: Design.myInputBorder,
                    enabledBorder: Design.myInputBorder,
                    focusedBorder: Design.myInputBorder,
                    labelText: 'Add a description',
                    labelStyle:
                    TextStyle(color: Color(0xffBCE0FD), fontSize: 16),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                child: TextField(
                  style: TextStyle(color: Color(0xff2699FB)),
                  //controller: partyDescriptionController,
                  decoration: InputDecoration(
                    prefixIcon:
                    Icon(Icons.production_quantity_limits, color: Color(0xff2699FB)),
                    border: Design.myInputBorder,
                    enabledBorder: Design.myInputBorder,
                    focusedBorder: Design.myInputBorder,
                    labelText: 'enter quantity',
                    labelStyle:
                    TextStyle(color: Color(0xffBCE0FD), fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel')),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Save')),
          ],
        );
      });

  Future OpenGuestsList() => showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
            child: Text(
              'Guests List',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xff2699FB),
              ),
            ),
          ),
          content: buildView(context),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel')),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Save')),
          ],
        );
      });

  Widget buildView(BuildContext context) {
    return Container(
      width: 500,
      height: 500,
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Jose Gustavo'),
            subtitle: Text('Primo'),
            trailing: Icon(Icons.cancel_outlined),
          );
        },
      ),
    );
  }
}
