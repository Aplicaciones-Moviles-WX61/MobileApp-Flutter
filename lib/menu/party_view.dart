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
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Builder(
            builder: (BuildContext context){
              return IconButton(
                icon: const Icon(Icons.arrow_back_ios_rounded,
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
              'Party detail...',
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
                  decoration: BoxDecoration(
                    color: Color(0xff2699FB)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text('29/10/2022', style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Fiesta de Jhon', style: TextStyle(
                            color: Colors.white,
                            fontSize: 30
                        ),),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Las Adelfas Mz B 16, Surco 15023', style: TextStyle(
                            color: Colors.white,
                            fontSize: 15
                        ),),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(bottom: 10, top: 10, left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Wishlist',
                          style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold))
                    ],
                  )
                ),

                Container(
                  height: 100,
                  margin: EdgeInsets.only(
                      bottom: 5, top: 5
                  ),
                  padding: EdgeInsets.only(
                      left: 25, right: 25
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xff2699FB),
                      borderRadius: BorderRadius.circular(25),
                    ),

                    padding: EdgeInsets.only(
                      left: 20, top: 15, bottom: 15
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/products/ron.png')
                              )
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Ron Cartavio (1L)', style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white
                                ),
                                ),
                                SizedBox(
                                  height:5
                                ),
                                Text(
                                  'Cantidad:   3 unidades', style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white
                                ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          //iconos
                        )
                      ],
                    ),

                  )


                ),

              Container(
              height: 100,
              margin: EdgeInsets.only(
                  bottom: 10, top: 10
              ),
              padding: EdgeInsets.only(
                  left: 25, right: 25
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff2699FB),
                  borderRadius: BorderRadius.circular(25),
                ),

                padding: EdgeInsets.only(
                    left: 20, top: 15, bottom: 15
                ),
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/products/cocacola.jpg')
                          )
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Coca Cola  (2.25L)', style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white
                            ),
                            ),
                            SizedBox(
                                height:5
                            ),
                            Text(
                              'Cantidad:   5 unidades', style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white
                            ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

              ),),

                Container(
                    height: 100,
                    margin: EdgeInsets.only(
                        bottom: 5, top: 5
                    ),
                    padding: EdgeInsets.only(
                        left: 25, right: 25
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xff2699FB),
                        borderRadius: BorderRadius.circular(25),
                      ),

                      padding: EdgeInsets.only(
                          left: 20, top: 15, bottom: 15
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage('assets/products/hielo.png')
                                )
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Hielo gourmet (2kg)', style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white
                                  ),
                                  ),
                                  SizedBox(
                                      height:5
                                  ),
                                  Text(
                                    'Cantidad:   10 kg', style: TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white
                                  ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                    )


                )

              ],
            ),


          ),
        ),
    );
  }
}
