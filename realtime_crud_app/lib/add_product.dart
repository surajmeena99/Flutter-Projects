import 'package:flutter/material.dart';
import 'package:realtime_crud_app/db_services.dart';

class Addproduct extends StatefulWidget {
  const Addproduct({super.key});

  @override
  State<Addproduct> createState() => _AddproductState();
}

class _AddproductState extends State<Addproduct> {

  final DatabaseService _databaseService = DatabaseService();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  bool _validateName = false;
  bool _validatePrice = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New product"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Add New product',
                style: TextStyle(fontSize: 20, color: Colors.teal, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20.0,),
              TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter Name',
                    labelText: 'Name',
                    errorText: _validateName ? 'Name Value Can\'t Be Empty' : null,
                  )),
              const SizedBox(height: 20.0,),
              TextField(
                  controller: _priceController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter Price',
                    labelText: 'Price',
                    errorText: _validatePrice ? 'Price Value Can\'t Be Empty' : null,
                  )),
              const SizedBox(height: 20.0,),
              Row(
                children: [
                  TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.teal,
                          textStyle: const TextStyle(fontSize: 15),
                      ),
                      onPressed: () async {
                        setState(() {
                          _nameController.text.isEmpty
                              ? _validateName = true
                              : _validateName = false;
                          _priceController.text.isEmpty
                              ? _validatePrice = true
                              : _validatePrice = false;
                        });
                        Map<String, dynamic> data = {
                          "name" : _nameController.text,
                          "price" : double.tryParse(_priceController.text)!,
                        };
                        if (_validateName == false &&  _validatePrice == false) {
                            await _databaseService.addData(data);

                            _nameController.text = '';
                            _priceController.text = '';
                            Navigator.of(context).pop();
                        }
                      },
                      child: const Text('Add product')),
                  const SizedBox(
                    width: 10.0,
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.red,
                          textStyle: const TextStyle(fontSize: 15)),
                      onPressed: () {
                        _nameController.text = '';
                        _priceController.text = '';
                      },
                      child: const Text('Clear Data'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}