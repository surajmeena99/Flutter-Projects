import 'package:flutter/material.dart';
import 'package:flutterwala_api/api_service.dart';
import 'package:flutterwala_api/edit_screen.dart';
import 'package:flutterwala_api/home_screen.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.selectedUser});

  final Map<String, dynamic> selectedUser;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  final ApiService _apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selected Item Details'),
        actions: [
          IconButton(onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => EditScreen(editUser: widget.selectedUser,))
            );
          }, icon: const Icon(Icons.edit)),
          IconButton(
            onPressed: () async {
              bool deleted = await _apiService.deleteItem(widget.selectedUser['id'].toString());

              if (deleted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Post deleted')),
                );
                Navigator.push(context, 
                  MaterialPageRoute(builder: (BuildContext context)=> const HomeScreen()),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Failed to delete')),
                );
              }
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListTile(
          title: Text(widget.selectedUser['name']),
          subtitle: Text(widget.selectedUser['email']),
          leading: Text(widget.selectedUser['id'].toString()),
        ),
      ),
    );
  }
}