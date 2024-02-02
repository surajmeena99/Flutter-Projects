import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:apnibook_app/screens.dart/client_details.dart';
import 'package:http/http.dart' as http;


class ClientScreen extends StatefulWidget {
  const ClientScreen({super.key});

  @override
  State<ClientScreen> createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {

  Future<List<dynamic>> fetchItems() async {
    final response = await http.get(Uri.parse('https://reqres.in/api/users?page=2'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> mapData = json.decode(response.body);
      final List<dynamic> listData = mapData['data'];
      return listData;
    } else {
      throw Exception('Failed to load user data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Client Book"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: fetchItems(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            final  items = snapshot.data!;
            return ListView.builder(
              itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return ListTile(
                    onTap: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ClientDetail(item: items[index],))
                      );
                    },
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(item['avatar']),
                    ),
                    title: Text(item['first_name'] + ' ' + item['last_name']),
                    subtitle: Text(item['email']),
                    trailing : Text(item['id'].toString()),
                  );
                },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}