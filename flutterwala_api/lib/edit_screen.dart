import 'package:flutter/material.dart';
import 'package:flutterwala_api/api_service.dart';
import 'package:flutterwala_api/home_screen.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key, required this.editUser});

  final Map<String, dynamic> editUser;

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  initState() {
    super.initState();
    nameController.text = widget.editUser['name'];
    emailController.text = widget.editUser['email'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
              ),
              TextFormField(
                controller: emailController,
              ),
              ElevatedButton(
                  onPressed: () async {
                    Map<String, String> data = {
                      'name': nameController.text,
                      'email': emailController.text,
                    };

                    bool status = await ApiService().updateItem(data, widget.editUser['id'].toString());

                    if (status) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(content: Text('Post updated')));

                      // Navigator.of(context).pop();
                      Navigator.push(context, 
                        MaterialPageRoute(builder: (BuildContext context)=> const HomeScreen()),
                      );
                    }else{
                      ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(content: Text('Failed to update the post')));
                    }
                  },
                  child: const Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}