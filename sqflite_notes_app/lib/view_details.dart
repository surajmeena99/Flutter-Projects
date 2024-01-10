import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sqflite_notes_app/notes_model.dart';
import 'package:sqflite_notes_app/database_helper.dart';
import 'package:sqflite_notes_app/edit_notes.dart';

class ViewDetails extends StatefulWidget {
  const ViewDetails({super.key, required this.user});

  final Notes user;

  @override
  State<ViewDetails> createState() => _ViewDetailsState();
}

class _ViewDetailsState extends State<ViewDetails> {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  Future<void> _deleteConfirmationDialog(Notes Notes) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Confirmation'),
          content: const Text('Are you sure you want to delete this Notes?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                await _databaseHelper.deleteNotes(Notes.id!);
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
      appBar: AppBar(
        title: const Text("Selected User Details"),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'Edit') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditNotes(user: widget.user),
                  ),
                ).then((data) {
                  if (data != null) {
                    _databaseHelper.getAllNotess();
                    _showSuccessSnackBar('User Detail Updated Success');
                  }
                  Navigator.pop(context);
                });
                print('Edit selected');
              } else if (value == 'Delete') {
                _deleteConfirmationDialog(widget.user);
                print('Delete selected');
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  value: 'Edit',
                  child: Text('Edit'),
                ),
                const PopupMenuItem<String>(
                  value: 'Delete',
                  child: Text('Delete'),
                ),
              ];
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image display container
            Container(
              height: 200,
              width: double.infinity,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: widget.user.image != null
                  ? Image.file(
                      File(widget.user.image!),
                      fit: BoxFit.cover,
                    )
                  : Image.asset("assets/images/suraj.jpg",
                      fit: BoxFit.cover,
                    ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Full Details",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.blueGrey,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text('Name',
                    style: TextStyle(
                        color: Colors.teal,
                        fontSize: 16,
                        fontWeight: FontWeight.w600)),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(widget.user.name,
                      style: const TextStyle(fontSize: 16)),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text('Notes',
                    style: TextStyle(
                        color: Colors.teal,
                        fontSize: 16,
                        fontWeight: FontWeight.w600)),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(widget.user.NotesNo,
                      style: const TextStyle(fontSize: 16)),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Description',
                    style: TextStyle(
                        color: Colors.teal,
                        fontSize: 16,
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 20),
                Text(widget.user.description,
                    style: const TextStyle(fontSize: 16)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
