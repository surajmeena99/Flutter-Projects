import 'package:flutter/material.dart';
import 'package:nbl_app/dashboard_screen.dart';
import 'package:nbl_app/login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  final GlobalKey<State> _key = GlobalKey<State>(); 
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final designation = TextEditingController();

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registration"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20,),
                Form(
                  key: _key,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: firstName,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          hintText: "Enter First Name",
                          labelText: "First Name"
                        ),
                      ),
                      const SizedBox(height: 10,),
                      TextFormField(
                        controller: lastName,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          hintText: "Enter Last Name",
                          labelText: "Last Name"
                        ),
                      ),
                      const SizedBox(height: 10,),
                      TextFormField(
                        controller: email,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          hintText: "Enter Email",
                          labelText: "Email"
                        ),
                      ),
                      const SizedBox(height: 10,),
                      TextFormField(
                        controller: password,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          hintText: "Enter Password",
                          labelText: "Password",
                          suffixIcon: GestureDetector(
                            onTap: (){
                              setState(() {
                                isVisible = !isVisible;
                              });
                            },
                            child: Icon(isVisible ? Icons.visibility : Icons.visibility_off),
                          )
                        ),
                         obscureText: isVisible ? false : true,
                      ),
                      const SizedBox(height: 10,),
                      TextFormField(
                        controller: designation,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          hintText: "Enter Designation",
                          labelText: "Designation"
                        ),
                      ),
                    ],
                  ),              
                ),
                const SizedBox(height: 10,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                    )
                  ),
                  onPressed: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const DashboardScreen()));
                  }, 
                  child: const Text("Register")
                ),
                const SizedBox(height: 10,),
                const Text("Already have an Account?", style: TextStyle(fontSize: 15, color: Colors.blue),),
                const SizedBox(height: 10,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                    )
                  ),
                  onPressed: (){
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()));
                  }, 
                  child: const Text("Login")
                ),
              ],  
            ),
          ),
        ),
      ),
    );
  }
}