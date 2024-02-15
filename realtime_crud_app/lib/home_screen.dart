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
      
      // body: FutureBuilder<Map<String, dynamic>?>(
      //   future: _databaseService.getData(),

      body: StreamBuilder<Map<String, dynamic>?>(
        stream: _databaseService.getData(),

        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No data available'));
          } else {            
            final products = snapshot.data!.values.toList();  //...
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];  //...
                final productId = snapshot.data!.keys.toList()[index];  //...
                return ListTile(
                  title: Text(product['name']),
                  subtitle: Text(product['price'].toString()),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => EditProduct(id: productId, editProduct: product))
                          );
                        }
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          _deleteConfirmationDialog(productId);
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