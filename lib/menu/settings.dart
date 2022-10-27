import 'package:flutter/material.dart';
import 'package:nextparty/auth/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => SettingsStateful();
}

class SettingsStateful extends State<Settings> {
  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    prefs.remove('id');
    prefs.remove('email');
    prefs.remove('name');
    prefs.remove('lastname');
    prefs.remove('phone');
    prefs.remove('birthday');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
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
                      // button to logout
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                          height: 50,
                          width: double.infinity,
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: ElevatedButton(
                            child: const Text('Logout'),
                            onPressed: () async {
                              logout();
                            },
                          )),
                    ],
                  ))),
        ));
  }
}
