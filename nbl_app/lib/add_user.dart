import 'package:flutter/material.dart';
import 'package:nbl_app/database_service.dart';
import 'package:nbl_app/user_model.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final designation = TextEditingController();

  bool _firstName = false;
  bool _lastName = false;
  bool _email = false;
  bool _password = false;
  bool _designation = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New User"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 20,),
                  TextField(
                    controller: firstName,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "Enter First Name",
                      labelText: "First Name",
                      errorText: _firstName ? 'Name Value Can\'t Be Empty' : null,
                    ),
                  ),
                  const SizedBox(height: 15,),
                  TextField(
                    controller: lastName,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "Enter Last Name",
                      labelText: "Last Name",
                      errorText: _lastName ? 'Name Value Can\'t Be Empty' : null,
                    ),
                  ),
                  const SizedBox(height: 15,),
                  TextField(
                    controller: email,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "Enter Email",
                      labelText: "Email",
                      errorText: _email ? 'Name Value Can\'t Be Empty' : null,
                    ),
                  ),
                  const SizedBox(height: 15,),
                  TextField(
                    controller: password,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "Enter Password",
                      labelText: "Password",
                      errorText: _password ? 'Name Value Can\'t Be Empty' : null,
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 15,),
                  TextField(
                    controller: designation,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "Enter Designation",
                      labelText: "Designation",
                      errorText: _designation ? 'Name Value Can\'t Be Empty' : null,
                    ),
                  ),
                  const SizedBox(height: 25,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                      )
                    ),
                    onPressed: () async{
                      final newUser = User(
                        id : null,
                        firstName: firstName.text, 
                        lastName: lastName.text, 
                        email: email.text,
                        password: password.text, 
                        designation: designation.text, 
                      );
                      await DatabaseService().addUser(newUser);
                      Navigator.pop(context);
                    }, 
                    child: const Text("Add User")
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}