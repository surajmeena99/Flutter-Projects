import 'package:flutter/material.dart';
import 'package:flutterwala_api/add_screen.dart';
import 'package:flutterwala_api/detail_screen.dart';
import 'package:flutterwala_api/login.dart';
import 'api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService apiService = ApiService();

  late Future<List<Map<String, dynamic>>> userList;
  
  @override
  void initState() {
    super.initState();
    userList = apiService.fetchItems();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter API App'),
          actions: [
            IconButton(
              onPressed: (){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              }, 
              icon: const Icon(Icons.logout),
            )
          ],
        ),
        body: FutureBuilder<List<Map<String, dynamic>>>(
          future: userList,
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
              final List<Map<String, dynamic>> users = snapshot.data!;
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final Map<String, dynamic> user = users[index];
                  return Column(
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => DetailScreen(selectedUser: user,))
                          );
                        },
                        title: Text(user['name'].toString()),
                        subtitle: Text(user['email'].toString()),
                        leading: Text(user['id'].toString()),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Divider(
                          thickness: 2,
                          color: Colors.black,
                        ),
                      )
                    ],
                  );
                },
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const AddScreen())
          );
        },
        child: const Icon(Icons.add),
      ),
      ),
    );
  }
}


