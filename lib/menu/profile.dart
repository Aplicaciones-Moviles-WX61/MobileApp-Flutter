import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../common/desing.dart';
import '../services/user_service.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => ProfileStateful();
}

formatDate(DateTime date) {
  return DateFormat('dd-MM-yyyy').format(date).toString();
}

class ProfileStateful extends State<Profile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    var user = userService().getUser();
    user.then((value) {
      nameController.text = value.name;
      lastNameController.text = value.lastname;
      emailController.text = value.email;
      phoneController.text = value.phone!;
      dateController.text = formatDate(value.birthday!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 156,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/profile/photo.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 12.0),
                height: MediaQuery.of(context).size.height / 1.7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      width: 360,
                      child: TextField(
                        controller: nameController,
                        style: const TextStyle(color: Color(0xff2699FB)),
                        decoration: const InputDecoration(
                            border: Design.editInputBorder,
                            enabledBorder: Design.editInputBorder,
                            focusedBorder: Design.editInputBorder,
                            prefixIcon:
                                Icon(Icons.person, color: Color(0xff2699FB)),
                            hintText: 'Name',
                            hintStyle: TextStyle(color: Color(0xff2699FB))),
                      ),
                    ),
                    SizedBox(
                      width: 360,
                      child: TextField(
                        controller: lastNameController,
                        style: const TextStyle(color: Color(0xff2699FB)),
                        decoration: const InputDecoration(
                            border: Design.editInputBorder,
                            enabledBorder: Design.editInputBorder,
                            focusedBorder: Design.editInputBorder,
                            prefixIcon:
                                Icon(Icons.person, color: Color(0xff2699FB)),
                            hintText: 'Last Name',
                            hintStyle: TextStyle(color: Color(0xff2699FB))),
                      ),
                    ),
                    SizedBox(
                      width: 360,
                      child: TextField(
                        controller: emailController,
                        style: const TextStyle(color: Color(0xff2699FB)),
                        decoration: const InputDecoration(
                            border: Design.editInputBorder,
                            enabledBorder: Design.editInputBorder,
                            focusedBorder: Design.editInputBorder,
                            prefixIcon:
                                Icon(Icons.email, color: Color(0xff2699FB)),
                            hintText: 'Email',
                            hintStyle: TextStyle(color: Color(0xff2699FB))),
                      ),
                    ),
                    SizedBox(
                      width: 360,
                      child: TextField(
                        controller: passwordController,
                        style: const TextStyle(color: Color(0xff2699FB)),
                        obscureText: true,
                        decoration: const InputDecoration(
                            border: Design.editInputBorder,
                            enabledBorder: Design.editInputBorder,
                            focusedBorder: Design.editInputBorder,
                            prefixIcon:
                                Icon(Icons.lock, color: Color(0xff2699FB)),
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Color(0xff2699FB))),
                      ),
                    ),
                    SizedBox(
                      width: 360,
                      child: TextField(
                        controller: phoneController,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(color: Color(0xff2699FB)),
                        decoration: const InputDecoration(
                            border: Design.editInputBorder,
                            enabledBorder: Design.editInputBorder,
                            focusedBorder: Design.editInputBorder,
                            prefixIcon:
                                Icon(Icons.phone, color: Color(0xff2699FB)),
                            hintText: 'Phone',
                            hintStyle: TextStyle(color: Color(0xff2699FB))),
                      ),
                    ),
                    SizedBox(
                      width: 360,
                      child: TextField(
                        controller: dateController,
                        readOnly: true,
                        style: const TextStyle(color: Color(0xff2699FB)),
                        decoration: const InputDecoration(
                            border: Design.editInputBorder,
                            enabledBorder: Design.editInputBorder,
                            focusedBorder: Design.editInputBorder,
                            prefixIcon: Icon(Icons.calendar_today,
                                color: Color(0xff2699FB)),
                            hintText: 'Birthday',
                            hintStyle: TextStyle(color: Color(0xff2699FB))),
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
                          child: const Text('Update'),
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
              ),
              //Name
            ],
          )),
        ));
  }
}
