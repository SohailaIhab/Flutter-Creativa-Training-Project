import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
//import 'package:flutter_application_1/signup_page.dart';

import 'home.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  void initState() {
    // TODO: implement initState


  }
  final _formKey = GlobalKey<FormState>();
  final TextEditingController myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child:Center( child: Container(width: 300,
              child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "LOG IN",
                style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 60,
              ),
              TextFormField(
                controller: myController,
                validator: (name) {
                  if (name != null && name.isEmpty != true) {
                    return null;
                  }
                  return "Not valied";
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Name"),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(

                validator: (mail) {
                  if (mail != null &&
                      mail.isEmpty != true &&
                      mail.contains("@") &&
                      mail.contains(".com")) {
                    return null;
                  }
                  return 'Invalid Email';
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "E-Mail",
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(obscureText :true,
                validator: (pass) {
                  if (pass != null && pass.length > 7) {
                    return null;
                  }
                  return "Weak";
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password",

                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(  style: ElevatedButton.styleFrom(
                primary: Colors.deepOrange,
              ),
                onPressed: () {

                  setState(() {
                    print(_formKey.currentState!.validate());
                  });
                  setState(() {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return HomePage(user: myController.text);
                        },
                      ));
                    }
                  });
                },

                child: Text(
                  "Log in",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("You don't have account ? "),
                  /*TextButton(
                    onPressed: () {
                      setState(() {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SignupPage();
                        }));
                      });
                    },
                    child: const Text("Sign Up"),
                  )*/
                ],
              ),
            ],
              ), )),
        ),
      ),
    );
  }
}
