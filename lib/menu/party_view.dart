import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nextparty/common/desing.dart';
import 'package:nextparty/services/items_service.dart';
import 'package:nextparty/services/party_service.dart';
import '../Models/user.dart';
import '../models/item.dart';
import '../models/party.dart';
import '../services/wishlist_service.dart';
import 'item_detail.dart';
import 'package:nextparty/models/wishlist.dart';

class PartyDetail extends StatefulWidget {
  PartyDetail({super.key, required this.party});
  final Party party;
  @override
  State<PartyDetail> createState() => PartyView(this.party);
}

class PartyView extends State<PartyDetail> {
  TextEditingController wishlistNameController = TextEditingController();

  TextEditingController itemNameController = TextEditingController();
  TextEditingController itemDescriptionController = TextEditingController();
  TextEditingController itemQuantityController = TextEditingController();

  TextEditingController partyNameController = TextEditingController();
  TextEditingController partyDescriptionController = TextEditingController();
  TextEditingController partyDateController = TextEditingController();
  TextEditingController partyLocationController = TextEditingController();

  TextEditingController guestEmailController = TextEditingController();

  late Party _party;
  Wishlist _wishlist = Wishlist(description: '');
  List<Item> _items = [];
  List<User> _guests = [];
  PartyView(Party party) {
    _party = party;
    var x = WishlistService().getWishlist(_party.id!);
    x.then((value) => setState(() {
          _wishlist = Wishlist.fromJson(jsonDecode(value!));
        }));
    var y = ItemsService().getItems(_party.id!);
    y.then((value) => setState(() {
          _items = (jsonDecode(value!) as List)
              .map((i) => Item.fromJson(i))
              .toList();
        }));
    var z = PartyService().getGuests(_party.id!);
    z.then((value) => setState(() {
          _guests = (jsonDecode(value!) as List)
              .map((i) => User.fromJson(i))
              .toList();
        }));
  }

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
        title: Text(
          _party.name,
          textAlign: TextAlign.center,
          style: const TextStyle(
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
                decoration: const BoxDecoration(color: Color(0xff2699FB)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        DateFormat('dd/MM/yyyy')
                            .format(DateTime.parse(_party.date!))
                            .toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        _party.name,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        _party.location!,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(
                    bottom: 20, top: 20, left: 15, right: 15),
                child: wishlistWidget(context),
              ),
              itemsList(_items),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'Editar Evento',
            backgroundColor: Colors.white,
            onPressed: () {
              openEditInfo(context);
            },
            tooltip: 'Editar Evento',
            child: const Icon(Icons.edit, color: Color(0xff2699FB)),
          ),
          const SizedBox(
            height: 600,
          ),
          FloatingActionButton(
            heroTag: 'Listar Invitados',
            backgroundColor: const Color(0xff2699FB),
            onPressed: () {
              openGuestsList(context);
            },
            tooltip: 'Lista de invitados',
            child: const Icon(Icons.groups),
          ),
        ],
      ),
    );
  }

  Future openEditInfo(BuildContext _context) => showDialog(
      context: _context,
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
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                child: TextField(
                  style: TextStyle(color: Color(0xff2699FB)),
                  controller: partyNameController,
                  decoration: const InputDecoration(
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
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                child: TextField(
                  style: TextStyle(color: Color(0xff2699FB)),
                  controller: partyDescriptionController,
                  decoration: const InputDecoration(
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
                  controller: partyDateController,
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
                    partyDateController.text =
                        DateFormat('yyyy-MM-dd').format(pickedDate!).toString();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                child: TextField(
                  style: TextStyle(color: Color(0xff2699FB)),
                  controller: partyLocationController,
                  decoration: const InputDecoration(
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
                child: const Text('Cancel')),
            TextButton(
                onPressed: () {
                  var pushParty = PartyDto(
                      name: partyNameController.text,
                      description: partyDescriptionController.text,
                      date: partyDateController.text,
                      location: partyDateController.text);
                  var x = PartyService().updateParty(_party.id!, pushParty);
                  x.then((value) {
                    setState(() {
                      print(value);
                      Navigator.of(context).pop();
                    });
                  });
                  Navigator.of(context).pop();
                },
                child: const Text('Save')),
          ],
        );
      });

  Future addItem(BuildContext _context) => showDialog(
      context: _context,
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
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                child: TextField(
                  style: TextStyle(color: Color(0xff2699FB)),
                  controller: itemNameController,
                  decoration: const InputDecoration(
                    prefixIcon:
                        Icon(Icons.card_giftcard, color: Color(0xff2699FB)),
                    border: Design.myInputBorder,
                    enabledBorder: Design.myInputBorder,
                    focusedBorder: Design.myInputBorder,
                    labelText: 'Product Name',
                    labelStyle:
                        TextStyle(color: Color(0xffBCE0FD), fontSize: 16),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                child: TextField(
                  style: TextStyle(color: Color(0xff2699FB)),
                  controller: itemDescriptionController,
                  decoration: const InputDecoration(
                    prefixIcon:
                        Icon(Icons.description, color: Color(0xff2699FB)),
                    border: Design.myInputBorder,
                    enabledBorder: Design.myInputBorder,
                    focusedBorder: Design.myInputBorder,
                    labelText: 'Description',
                    labelStyle:
                        TextStyle(color: Color(0xffBCE0FD), fontSize: 16),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                child: TextField(
                  style: TextStyle(color: Color(0xff2699FB)),
                  controller: itemQuantityController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.numbers, color: Color(0xff2699FB)),
                    border: Design.myInputBorder,
                    enabledBorder: Design.myInputBorder,
                    focusedBorder: Design.myInputBorder,
                    labelText: 'Quantity',
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
                  AddItemDto item = AddItemDto(
                    name: itemNameController.text,
                    description: itemDescriptionController.text,
                    quantity: int.parse(itemQuantityController.text),
                    category_id: 1,
                  );
                  var result = ItemsService().addItem(_party.id!, item);
                  result.then((value) => {
                        if (value != null) {Navigator.of(context).pop()}
                      });
                  Navigator.of(context).pop();
                },
                child: Text('Save')),
          ],
        );
      });

  Future openGuestsList(BuildContext _context) => showDialog(
      context: _context,
      builder: (context) {
        return AlertDialog(
          title: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Guests List',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff2699FB),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                    style: TextStyle(color: Color(0xff2699FB)),
                    controller: guestEmailController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person, color: Color(0xff2699FB)),
                      border: Design.myInputBorder,
                      enabledBorder: Design.myInputBorder,
                      focusedBorder: Design.myInputBorder,
                      labelText: 'Email',
                      labelStyle:
                          TextStyle(color: Color(0xffBCE0FD), fontSize: 16),
                    )),
                Container(
                    height: 50,
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: ElevatedButton(
                      child: const Text('Add Guest'),
                      onPressed: () {
                        var pushGuest =
                            InviteDto(email: guestEmailController.text);
                        var x =
                            PartyService().inviteGuest(_party.id!, pushGuest);
                        x.then(
                          (value) => () {
                            if (value == true) {
                              print("SISSSSSSSSSSSSSSSS");
                              Navigator.of(context).pop();
                            }
                          },
                        );
                      },
                    )),
              ],
            ),
          ),
          content: guestList(context),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Close')),
          ],
        );
      });

  Future openCreateWishlist(BuildContext _context, int id) => showDialog(
      context: _context,
      builder: (context) {
        return AlertDialog(
          title: const Center(
            child: Text(
              'Add Wishlist to the Party',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xff2699FB),
              ),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                style: TextStyle(color: Color(0xff2699FB)),
                controller: wishlistNameController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.description, color: Color(0xff2699FB)),
                  border: Design.myInputBorder,
                  enabledBorder: Design.myInputBorder,
                  focusedBorder: Design.myInputBorder,
                  labelText: 'Description',
                  labelStyle: TextStyle(color: Color(0xffBCE0FD), fontSize: 16),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel')),
            TextButton(
                onPressed: () {
                  Wishlist pushWishlist =
                      Wishlist(description: wishlistNameController.text);
                  var response =
                      WishlistService().addWishlist(id, pushWishlist);
                  response.then((value) => {
                        print(value),
                      });
                  Navigator.of(context).pop();
                },
                child: const Text('Save')),
          ],
        );
      });

  Widget guestList(BuildContext context) {
    return Container(
      width: 500,
      // height: 500,
      child: ListView.builder(
        itemCount: _guests.length,
        itemBuilder: (context, index) {
          User guest = _guests[index];
          return ListTile(
            title: Text('${guest.name} ${guest.lastname}'),
            subtitle: Text(guest.email),
          );
        },
      ),
    );
  }

  Widget wishlistWidget(BuildContext _context) {
    if (_wishlist.id != null) {
      return (Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('My Wishlist',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff2699FB),
                )),
            Text(_wishlist.description,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xff2699FB),
                )),
          ]),
          TextButton(
              onPressed: () {
                addItem(context);
              },
              child: const Icon(Icons.add_circle, size: 30.0)),
        ],
      ));
    }
    return (Center(
      child: Column(
        children: [
          IconButton(
            icon: const Icon(Icons.add_circle, color: Color(0xff2699FB)),
            iconSize: 50,
            onPressed: () {
              openCreateWishlist(_context, _party.id!);
            },
          ),
          const Text('Add Wishlist',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xff2699FB),
              )),
        ],
      ),
    ));
  }

  Widget itemsList(List<Item> items) {
    return (ListView.builder(
      itemCount: items.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        Item item = items[index];
        return Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ItemDetail(item: item)));
                },
                title: Text(
                  item.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff2699FB),
                  ),
                ),
                subtitle: Text(
                  item.description,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xff2699FB),
                  ),
                ),
                trailing: Text(
                  item.quantity.toString(),
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xff2699FB),
                  ),
                ),
              ),
            ));
      },
    ));
  }
}
