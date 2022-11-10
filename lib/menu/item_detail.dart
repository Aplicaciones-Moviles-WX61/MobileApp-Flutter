import 'package:flutter/material.dart';

class ItemDetail extends StatefulWidget {
  const ItemDetail({Key? key}) : super(key: key);

  @override
  State<ItemDetail> createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext){
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded,
              color: Color(0xff2699FB)),
              onPressed: (){
                if(Navigator.canPop(context)){
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
            fontWeight: FontWeight.bold
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
                  padding: const EdgeInsets.all(25.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          Text('RON CARTAVIO', style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold
                          )),
                          SizedBox(height: 10),
                          Text('Descripcion', style: TextStyle(
                              color: Colors.white,
                              fontSize: 15
                          )),
                          SizedBox(height: 10)
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 110),
                            child: Container(
                              child: IconButton(
                                  icon: Image.asset('assets/icons/edit_event.png'),
                                  iconSize: 35,
                                  onPressed: (){}
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25),
                child: Container(
                  height: 375,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image:
                        AssetImage('assets/products/ron.png'),
                      fit: BoxFit.cover
                    ),
                  ),
                ),
              ),
              Row(
                children:[
                  Container(
                    width: 35,
                    child: IconButton(
                        icon: Image.asset('assets/icons/minus.png'),
                        onPressed: (){}
                    )
                  ),
                  Container(
                    width: 35,
                    child: TextField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: '3',
                      ),
                    ),
                  ),
                  Container(
                    width: 35,
                    child: IconButton(
                        icon: Image.asset('assets/icons/plus.png'),
                        onPressed: (){}
                    ),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Container(
                  child: IconButton(
                      icon: Image.asset('assets/icons/save.png'),
                      iconSize: 25,
                      highlightColor: Color(0xff2699FB),
                      onPressed: (){}
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
