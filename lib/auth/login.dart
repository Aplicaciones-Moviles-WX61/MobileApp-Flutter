import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nextparty/auth/forgot_password.dart';
import 'package:nextparty/auth/register.dart';
import 'package:nextparty/index.dart';
import 'package:nextparty/services/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => LoginStateful();
}

class LoginStateful extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  userService auth = userService();

  static const OutlineInputBorder myInputBorder = OutlineInputBorder(
      borderSide: BorderSide(
    color: Color(0xffBCE0FD),
  ));

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

  authLogin(email, password) async {
    var user = await auth.AuthUser(email, password);
    if (user != null) {
      Map<String, dynamic> body = jsonDecode(user);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', body['token']);
      prefs.setString('id', jsonEncode(body['user']['id']));
      prefs.setString('email', jsonEncode(body['user']['email']));
      prefs.setString('name', jsonEncode(body['user']['name']));
      prefs.setString('lastname', jsonEncode(body['user']['lastname']));
      prefs.setString('phone', jsonEncode(body['user']['phone']));
      prefs.setString('birthday', jsonEncode(body['user']['birthday']));
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
                            border: myInputBorder,
                            enabledBorder: myInputBorder,
                            focusedBorder: myInputBorder,
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
                            border: myInputBorder,
                            enabledBorder: myInputBorder,
                            focusedBorder: myInputBorder,
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
                            authLogin(
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
