import 'package:flutter/material.dart';
import 'package:nextparty/models/item.dart';
import '../common/desing.dart';
import '../services/items_service.dart';

class ItemDetail extends StatefulWidget {
  const ItemDetail({Key? key, required this.item}) : super(key: key);
  final Item item;
  @override
  State<ItemDetail> createState() => Detail(item);
}

class Detail extends State<ItemDetail> {
  late Item item;

  Detail(this.item);

  TextEditingController itemNameController = TextEditingController();
  TextEditingController itemDescriptionController = TextEditingController();
  TextEditingController itemQuantityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded,
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
          'Details',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color(0xff2699FB),
              fontSize: 18,
              fontWeight: FontWeight.bold),
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
                  padding: const EdgeInsets.all(25.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Text(item.name,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(height: 10),
                          Text('Quantity: x${item.quantity}',
                              style: const TextStyle(
                                  color: Color(0xffF1F9FF), fontSize: 15)),
                          const SizedBox(height: 10)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  children: [
                    Container(
                      height: 375,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/products/ron.png'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(item.description,
                        style: const TextStyle(
                            color: Color(0xff2699FB),
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openEditItem(context);
        },
        backgroundColor: const Color(0xff2699FB),
        child: IconButton(
            icon: const Icon(Icons.edit_note, color: Colors.white, size: 40),
            onPressed: () {
              openEditItem(context);
            }),
      ),
    );
  }

  Future openEditItem(BuildContext context) => showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Center(
            child: Text(
              'Edit Item',
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
                padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                child: TextField(
                  style: const TextStyle(color: Color(0xff2699FB)),
                  controller: itemNameController,
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
                padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                child: TextField(
                  style: const TextStyle(color: Color(0xff2699FB)),
                  controller: itemDescriptionController,
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
                padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                child: TextField(
                  style: const TextStyle(color: Color(0xff2699FB)),
                  controller: itemQuantityController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: false,
                    signed: true,
                  ),
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
                  itemDescriptionController.clear();
                  itemNameController.clear();
                  itemQuantityController.clear();
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel')),
            TextButton(
                onPressed: () {
                  AddItemDto addItemDto = AddItemDto(
                      name: itemNameController.text,
                      description: itemDescriptionController.text,
                      quantity: int.parse(itemQuantityController.text));
                  var y = ItemsService().updateItem(item.id!, addItemDto);
                  y.then((value) => {Navigator.of(context).pop()});
                },
                child: const Text('Save'))
          ],
        );
      });
}
