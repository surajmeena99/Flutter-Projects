import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:realtime_crud_app/add_product.dart';
import 'package:realtime_crud_app/db_services.dart';
import 'package:realtime_crud_app/edit_product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final DatabaseService _databaseService = DatabaseService();

  Future<void> _deleteConfirmationDialog(String id) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Confirmation'),
          content: const Text('Are you sure you want to delete this Product?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                await _databaseService.deleteData(id);
                setState(() {}); // Refresh the UI
                Navigator.pop(context);
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('products List'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      // body: StreamBuilder<DatabaseEvent>(
      //   stream: _databaseService.getData(),

      body: StreamBuilder<DatabaseEvent>(
        stream: FirebaseDatabase.instance.ref().child('products').onValue,
      
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {         
            final data = snapshot.data!.snapshot.value as Map<dynamic, dynamic>?;  
            if (data == null) {
              return const Center(child: Text('No data available'));
            }
            final products = data.values.toList();
            final productKeys = data.keys.toList();
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index] as Map<dynamic, dynamic>;
                final productId = productKeys[index];
                return ListTile(
                  title: Text(product['name'].toString()),
                  subtitle: Text(product['price'].toString()),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => EditProduct(id: productId.toString(), editProduct: product)),
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          _deleteConfirmationDialog(productId.toString());
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),

      /*------------
      body: FutureBuilder<DatabaseEvent>(
      // body: FutureBuilder<DataSnapshot>(
        future: _databaseService.getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {         
            final data = snapshot.data!.snapshot.value as Map<dynamic, dynamic>?; /* for DatabaseEvent */
            // final data = snapshot.data!.value as Map<dynamic, dynamic>?; /* for DataSnapshot */
            if (data == null) {
              return const Center(child: Text('No data available'));
            }
            final products = data.values.toList();
            final productKeys = data.keys.toList();
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index] as Map<dynamic, dynamic>;
                final productId = productKeys[index];
                return ListTile(
                  title: Text(product['name'].toString()),
                  subtitle: Text(product['price'].toString()),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => EditProduct(id: productId.toString(), editProduct: product)),
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          _deleteConfirmationDialog(productId.toString());
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
      ------------*/

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => const Addproduct())
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}