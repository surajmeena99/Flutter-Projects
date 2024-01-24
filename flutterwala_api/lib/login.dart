import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutterwala_api/home_screen.dart';
import 'package:flutterwala_api/register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController user = TextEditingController();
  final TextEditingController pass = TextEditingController();

  Future<void> login() async {
    final response = await http.post(Uri.parse("http://flutterwala.mooo.com/login.php"),
      body: json.encode({
        "username": user.text,
        "password": pass.text,
      }),
      headers: {
        'Content-Type': 'application/json', // Set content type to JSON
      },
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      if (data == "Success") {
        Fluttertoast.showToast(
          msg: 'Login Successful',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        Fluttertoast.showToast(
          msg: 'Username and password invalid',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } else {
      throw Exception('Failed to connect to the server');
    }
  }

  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.teal.shade200, 
                Colors.purple.shade900
              ]
            )
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 100,
                    width: 300,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.red, 
                          Colors.yellow
                        ]
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          spreadRadius: 3,
                          color: Colors.black12
                        )
                      ],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(200),
                        bottomRight: Radius.circular(200),
                      )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 35, left: 65),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text('Let\'s',
                            style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white,
                              shadows: [
                                Shadow(
                                  color: Colors.black45,
                                  offset: Offset(1, 1),
                                  blurRadius: 5,
                                )
                              ]
                            ),
                          ),
                          Text(' Login',
                            style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.pink.shade600,
                              shadows: const [
                                Shadow(
                                  color: Colors.black45,
                                  offset: Offset(1, 1),
                                  blurRadius: 5
                                )
                              ]
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30).copyWith(bottom: 10),
                  child: TextField(
                    controller: user,
                    style: const TextStyle(color: Colors.white, fontSize: 14.5),
                    decoration: InputDecoration(
                      prefixIconConstraints: const BoxConstraints(minWidth: 45),
                      prefixIcon: const Icon(Icons.alternate_email_outlined,color: Colors.white70,size: 22,),
                      border: InputBorder.none,
                      hintText: 'Enter Username',
                      hintStyle: const TextStyle(color: Colors.white60, fontSize: 14.5),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100).copyWith(
                          bottomRight: const Radius.circular(0)
                        ),
                        borderSide: const BorderSide(color: Colors.white38)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100).copyWith(
                            bottomRight: const Radius.circular(0)
                          ),
                          borderSide: const BorderSide(color: Colors.white70)
                      )
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30).copyWith(bottom: 10),
                  child: TextField(
                    controller: pass,
                    style: const TextStyle(color: Colors.white, fontSize: 14.5),
                    obscureText: isPasswordVisible ? false : true,
                    decoration: InputDecoration(
                      prefixIconConstraints: const BoxConstraints(minWidth: 45),
                      prefixIcon: const Icon(Icons.lock, color: Colors.white70, size: 22,),
                      suffixIconConstraints: const BoxConstraints(minWidth: 45, maxWidth: 46),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                        child: Icon(isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                          color: Colors.white70,
                          size: 22,
                        ),
                      ),
                      border: InputBorder.none,
                      hintText: 'Enter Password',
                      hintStyle: const TextStyle(color: Colors.white60, fontSize: 14.5),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100).copyWith(
                          bottomRight: const Radius.circular(0)
                        ),
                        borderSide: const BorderSide(color: Colors.white38)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100).copyWith(
                          bottomRight: const Radius.circular(0)
                        ),
                        borderSide: const BorderSide(color: Colors.white70)
                      )
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () {
                    login();
                  },
                  child: Container(
                    height: 53,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Colors.black12.withOpacity(.2),
                          offset: const Offset(2, 2)
                        )
                      ],
                      borderRadius: BorderRadius.circular(100).copyWith(bottomRight: const Radius.circular(0)),
                      gradient: LinearGradient(
                        colors: [
                          Colors.purple.shade600,
                          Colors.amber.shade900
                        ]
                      )
                    ),
                    child: Text('Login',
                      style: TextStyle(color: Colors.white.withOpacity(.8),fontSize: 15, fontWeight: FontWeight.bold)
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text('Don\'t have an account?',
                  style: TextStyle(color: Colors.white70, fontSize: 13)
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Register()),
                    );
                  },
                  child: Container(
                    height: 53,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white60),
                      borderRadius: BorderRadius.circular(100).copyWith(bottomRight: const Radius.circular(0)),
                    ),
                    child: Text('Sign Up',
                      style: TextStyle(color: Colors.white.withOpacity(.8),fontSize: 15,fontWeight: FontWeight.bold)
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}