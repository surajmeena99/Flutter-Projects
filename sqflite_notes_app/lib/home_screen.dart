import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sqflite_notes_app/add_notes.dart';
import 'package:sqflite_notes_app/view_details.dart';
import 'notes_model.dart';
import 'database_helper.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Notes>> _NotesList;
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    _NotesList = _databaseHelper.getAllNotess();
  }

  _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Notes>>(
        future: _NotesList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final Notess = snapshot.data;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: Notess!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ViewDetails(user: Notess[index]),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Card(
                        margin: const EdgeInsets.all(10),
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: SizedBox(
                            width: double.infinity,
                            height: 150, // Set the height of the Card as needed
                            child: Notess[index].image != null
                                ? Image.file(
                                    File(Notess[index].image!),
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset(
                                    "assets/images/suraj.jpg",
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8.0), // Add spacing between image and text
                      Text(
                        Notess[index].name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddNotes()),
          ).then((data) {
            if (data != null) {
              _databaseHelper.getAllNotess();
              _showSuccessSnackBar('Notes Detail Added Success');
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
