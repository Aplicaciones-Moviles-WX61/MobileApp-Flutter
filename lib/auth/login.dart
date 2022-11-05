import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nextparty/auth/forgot_password.dart';
import 'package:nextparty/auth/register.dart';
import 'package:nextparty/index.dart';
import 'package:nextparty/services/user_service.dart';

import '../Models/user.dart';
import '../common/desing.dart';
import '../preferences/preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => LoginStateful();
}

class LoginStateful extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  userService auth = userService();

  initState() {
    super.initState();
    auth.isLogged().then((value) {
      if (value) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Index()),
        );
      }
    });
  }

  login(email, password) async {
    var user = await auth.AuthUser(email, password);
    if (user != null) {
      Map<String, dynamic> body = jsonDecode(user);
      Preferences prefs = Preferences();
      await prefs.init();
      await prefs.saveToken(body['token']);
      User _user = User.fromJson(body['user']);
      await prefs.saveUser(_user);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Index()),
      );
    } else {
      showAboutDialog(
        context: context,
        children: [
          const Text('Email or password is incorrect'),
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
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Sing In',
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff2699FB)),
                    ),
                    Row(
                      children: [
                        const Text(
                          'Don\'t have an account?',
                          style:
                              TextStyle(fontSize: 16, color: Color(0xff2699FB)),
                        ),
                        TextButton(
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff2699FB)),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Register()));
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 360,
                      child: TextField(
                        controller: emailController,
                        style: const TextStyle(color: Color(0xff2699FB)),
                        decoration: const InputDecoration(
                            border: Design.myInputBorder,
                            enabledBorder: Design.myInputBorder,
                            focusedBorder: Design.myInputBorder,
                            prefixIcon:
                                Icon(Icons.email, color: Color(0xff2699FB)),
                            hintText: 'Email',
                            hintStyle: TextStyle(color: Color(0xff2699FB))),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 16),
                      width: 360,
                      child: TextField(
                        controller: passwordController,
                        style: const TextStyle(color: Color(0xff2699FB)),
                        obscureText: true,
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
                        height: 50,
                        width: double.infinity,
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: ElevatedButton(
                          child: const Text('Login'),
                          onPressed: () {
                            login(
                                emailController.text, passwordController.text);
                          },
                        )),
                  ],
                ),
                Column(children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Image(
                          image: AssetImage('assets/logos/gg.png'),
                        ),
                        Image(
                          image: AssetImage('assets/logos/fb.png'),
                        ),
                        Image(
                          image: AssetImage('assets/logos/tw.png'),
                        )
                      ],
                    ),
                  ),
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
        ),
      )),
    );
  }
}
