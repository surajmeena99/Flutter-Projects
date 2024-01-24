import 'package:flutter/material.dart';
import 'package:flutterwala_api/api_service.dart';
import 'package:flutterwala_api/home_screen.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {

  final ApiService apiService = ApiService();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  bool choice = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Your Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12)
                ),
                hintText: "Enter Name",
                labelText:"Name" 
              ),
            ),
            const SizedBox(height: 20,),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12)
                ),
                hintText: "example@gmail.com",
                labelText:"Email" 
              ),
            ),
            const Spacer(),
            SizedBox(
              child: ElevatedButton(
                onPressed: () async {
                  Map<String, dynamic> data = {
                    'name': nameController.text,
                    'email': emailController.text,
                  };
      
                  bool status = await apiService.addItem(data);
      
                  if (status) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Post added'))
                    );
                    Navigator.push(context, 
                      MaterialPageRoute(builder: (BuildContext context)=> const HomeScreen()),
                    );
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Failed to add the post'))
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}