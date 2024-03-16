import 'package:flutter/material.dart';
import 'package:nbl_app/dashboard_screen.dart';
import 'package:nbl_app/registration_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final GlobalKey<State> _key = GlobalKey<State>(); 
  
  final email = TextEditingController();
  final password = TextEditingController();

  void _validation(){
    if(email.text.isNotEmpty && password.text.isNotEmpty){
      Navigator.push(context,
       MaterialPageRoute(builder: (context) => const RegistrationScreen()));
    }else{
    
    }
  }

  bool isVisible = false;

  // final bool _email = false;
  // final bool _password = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
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
                        controller: email,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          hintText: "Enter Email",
                          labelText: "Email"
                        ),
                      ),
                      // Text(email.text.isEmpty ? "Please Enter Email" : ''),

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
                  child: const Text("Login")
                ),
                const SizedBox(height: 10,),
                const Text("Don't have an Account?", style: TextStyle(fontSize: 15, color: Colors.blue),),
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
                    MaterialPageRoute(builder: (context) => const RegistrationScreen()));
                  }, 
                  child: const Text("Register")
                ),
              ],  
            ),
          ),
        ),
      ),
    );
  }
}