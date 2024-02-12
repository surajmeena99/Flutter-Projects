import 'package:flutter/material.dart';
import 'package:realtime_crud_app/db_services.dart';

class EditProduct extends StatefulWidget {
  const EditProduct({super.key,  required this.editProduct, required this.id});

  final Map editProduct;
  final String id;

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {

  final DatabaseService _databaseService = DatabaseService();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  bool _validateName = false;
  bool _validatePrice = false;

  @override
  initState() {
    super.initState();
    _nameController.text = widget.editProduct['name'];
    _priceController.text = widget.editProduct['price'].toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit product"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Edit This product',
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

                        final String name = _nameController.text;
                        final double? price = double.tryParse(_priceController.text);

                        if (_validateName == false &&  _validatePrice == false) {
                          await _databaseService.updateData(widget.id, name, price!);

                          _nameController.text = '';
                          _priceController.text = '';
                          Navigator.of(context).pop();
                        }
                      },
                      child: const Text('Update product')),
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
