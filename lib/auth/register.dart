import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nextparty/auth/forgot_password.dart';
import '../services/user_service.dart';
import 'login.dart';
import 'package:nextparty/common/desing.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => RegisterStateful();
}

class RegisterStateful extends State<Register> {
  UserService auth = UserService();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  // register
  register() async {
    var user = await auth.registerUser(
      registerDto(
          name: nameController.text,
          lastname: lastNameController.text,
          email: emailController.text,
          password: passwordController.text,
          phone: phoneController.text,
          birthday: DateFormat('yyyy-MM-dd')
              .format(DateTime.parse(dateController.text))
              .toString()),
    );
    if (user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
      print(user);
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
            padding: const EdgeInsets.all(24.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height - window.padding.top,
              // width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Sign Up',
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff2699FB)),
                      ),
                      Row(
                        children: [
                          const Text(
                            'Already have an account?',
                            style: TextStyle(
                                fontSize: 16, color: Color(0xff2699FB)),
                          ),
                          TextButton(
                            child: const Text(
                              'Sign In',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff2699FB)),
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Login()));
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: TextField(
                          style: const TextStyle(color: Color(0xff2699FB)),
                          controller: nameController,
                          decoration: const InputDecoration(
                            border: Design.myInputBorder,
                            enabledBorder: Design.myInputBorder,
                            focusedBorder: Design.myInputBorder,
                            hintText: 'Name',
                            hintStyle: TextStyle(color: Color(0xff2699FB)),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: TextField(
                          style: const TextStyle(color: Color(0xff2699FB)),
                          controller: lastNameController,
                          decoration: const InputDecoration(
                              border: Design.myInputBorder,
                              enabledBorder: Design.myInputBorder,
                              focusedBorder: Design.myInputBorder,
                              hintText: 'Lastname',
                              hintStyle: TextStyle(color: Color(0xff2699FB))),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: TextField(
                          style: const TextStyle(color: Color(0xff2699FB)),
                          controller: emailController,
                          decoration: const InputDecoration(
                              border: Design.myInputBorder,
                              enabledBorder: Design.myInputBorder,
                              focusedBorder: Design.myInputBorder,
                              prefixIcon:
                                  Icon(Icons.email, color: Color(0xff2699FB)),
                              hintText: 'E-mail',
                              hintStyle: TextStyle(color: Color(0xff2699FB))),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: TextField(
                          style: const TextStyle(color: Color(0xff2699FB)),
                          obscureText: true,
                          controller: passwordController,
                          decoration: const InputDecoration(
                              border: Design.myInputBorder,
                              enabledBorder: Design.myInputBorder,
                              focusedBorder: Design.myInputBorder,
                              prefixIcon:
                                  Icon(Icons.lock, color: Color(0xff2699FB)),
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Color(0xff2699FB))),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: TextField(
                          style: const TextStyle(color: Color(0xff2699FB)),
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                              border: Design.myInputBorder,
                              enabledBorder: Design.myInputBorder,
                              focusedBorder: Design.myInputBorder,
                              prefixIcon:
                                  Icon(Icons.phone, color: Color(0xff2699FB)),
                              hintText: 'Phone',
                              hintStyle: TextStyle(color: Color(0xff2699FB))),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
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
                              hintText: 'Birthday',
                              hintStyle: TextStyle(color: Color(0xff2699FB))),
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
                      Container(
                          height: 50,
                          width: double.infinity,
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: ElevatedButton(
                            child: const Text('Register'),
                            onPressed: () {
                              register();
                            },
                          )),
                    ],
                  ),
                  Column(children: [
                    Container(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Forgot password?',
                              style: TextStyle(
                                  fontSize: 16, color: Color(0xff2699FB)),
                            ),
                            TextButton(
                              child: const Text(
                                'Reset',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff2699FB)),
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ForgotPassword()));
                              },
                            )
                          ],
                        ))
                  ]),
                ],
              ),
            ),
          )),
        ));
  }
}
