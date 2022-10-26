import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nextparty/auth/forgot_password.dart';

import 'login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => RegisterStateful();
}

class RegisterStateful extends State<Register> {
  // Duration get loginTime => Duration(milliseconds: 2250); // 2.25 seconds to wait

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController dateController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                          style:
                              TextStyle(fontSize: 16, color: Color(0xff2699FB)),
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
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Name',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: TextField(
                        controller: lastNameController,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Lastname',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: TextField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          icon: Icon(Icons.email),
                          labelText: 'E-mail',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: TextField(
                        obscureText: true,
                        controller: passwordController,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          icon: Icon(Icons.lock),
                          labelText: 'Password',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: TextField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          icon: Icon(Icons.phone),
                          labelText: 'Phone',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: TextField(
                        controller: dateController,
                        readOnly: true,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          icon: Icon(Icons.calendar_today),
                          labelText: 'Birthday',
                        ),
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101));
                          dateController.text = DateFormat('dd/MM/yyyy')
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
                            print('----Login button pressed----');
                            print('Name: ${nameController.text}');
                            print('Lastname: ${lastNameController.text}');
                            print('E-mail: ${emailController.text}');
                            print('Phone: ${phoneController.text}');
                            print('Password: ${passwordController.text}');
                            print('Birthday: ${dateController.text}');
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
          )),
        ));
  }
}
