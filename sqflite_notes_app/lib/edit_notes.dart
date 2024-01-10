import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sqflite_notes_app/notes_model.dart';
import 'package:sqflite_notes_app/database_helper.dart';
import 'package:image_picker/image_picker.dart';

class EditNotes extends StatefulWidget {
  const EditNotes({Key? key, required this.user}) : super(key: key);

  final Notes user;

  @override
  State<EditNotes> createState() => _EditNotesState();
}

class _EditNotesState extends State<EditNotes> {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  final _userNameController = TextEditingController();
  final _userNotesController = TextEditingController();
  final _userDescriptionController = TextEditingController();
  int? _userID;

  File? _selectedImage; // Added for image selection
  bool _validateName = false;
  bool _validateNotes = false;
  bool _validateDescription = false;

  @override
  void initState() {
    setState(() {
      _userID = widget.user.id;
      _userNameController.text = widget.user.name;
      _userNotesController.text = widget.user.NotesNo;
      _userDescriptionController.text = widget.user.description;
      // Assign the existing image path to _selectedImage
      _selectedImage = widget.user.image != null ? File(widget.user.image!) : null;
    });
    super.initState();
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit User Details"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Edit User Details',
                style: TextStyle(fontSize: 20, color: Colors.teal, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: _userNameController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter Name',
                    labelText: 'Name',
                    errorText: _validateName ? 'Name Value Can\'t Be Empty' : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: _userNotesController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter Notes',
                    labelText: 'Notes',
                    errorText: _validateNotes ? 'Notes Value Can\'t Be Empty' : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: _userDescriptionController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter Description',
                    labelText: 'Description',
                    errorText: _validateDescription ? 'Description Value Can\'t Be Empty' : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              // Image selection button
              ElevatedButton(
                onPressed: () async {
                  await _pickImage();
                },
                child: const Text('Select Image'),
              ),
              const SizedBox(
                height: 20.0,
              ),
              // Display selected image
              _selectedImage != null
                  ? Image.file(
                      _selectedImage!,
                      height: 100.0,
                      width: 100.0,
                      fit: BoxFit.cover,
                    )
                  : const SizedBox.shrink(),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.teal,
                          textStyle: const TextStyle(fontSize: 15)),
                      onPressed: () async {
                        setState(() {
                          _userNameController.text.isEmpty
                              ? _validateName = true
                              : _validateName = false;
                          _userNotesController.text.isEmpty
                              ? _validateNotes = true
                              : _validateNotes = false;
                          _userDescriptionController.text.isEmpty
                              ? _validateDescription = true
                              : _validateDescription = false;
                        });
                        if (_validateName == false &&
                            _validateNotes == false &&
                            _validateDescription == false) {
                          var user = Notes(
                            id: _userID,
                            name: _userNameController.text,
                            NotesNo: _userNotesController.text,
                            description: _userDescriptionController.text,
                            image: _selectedImage?.path,
                          );
                          await _databaseHelper.updateNotes(user);
                          Navigator.pop(context);
                        }
                      },
                      child: const Text('Update Details')),
                  const SizedBox(
                    width: 10.0,
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.red,
                          textStyle: const TextStyle(fontSize: 15)),
                      onPressed: () {
                        _userNameController.text = '';
                        _userNotesController.text = '';
                        _userDescriptionController.text = '';
                        setState(() {
                          _selectedImage = null;
                        });
                      },
                      child: const Text('Clear Details'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
