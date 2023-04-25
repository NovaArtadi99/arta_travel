import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "package:image_picker/image_picker.dart";
import 'package:travel/models/place.dart';
import 'package:travel/services/databasehelper.dart';

class PlaceAdd extends StatefulWidget {
  final Place _place;
  PlaceAdd(this._place,
      {required Null Function(File image) onImageSelected, required place});

  @override
  State<PlaceAdd> createState() => _PlaceAddState(this._place);
}

class _PlaceAddState extends State<PlaceAdd> {
  final Place _place;
  _PlaceAddState(this._place);
  late final nameController = TextEditingController();
  final codeController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final imageUrlController = TextEditingController();
  final categoryController = TextEditingController();
  final locationController = TextEditingController();
  bool isEditing = false;
  File?
      imageFile; // tambahkan variabel untuk menampung file gambar yang dipilih
  DatabaseHelper dbHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    if (_place.id != null) {
      isEditing = true;
    }
  }

  Future<void> addOrEditPlace() async {
    String desc = descriptionController.text;
    String name = nameController.text;
    String code = codeController.text;
    String price = priceController.text;
    String imageUrl = imageUrlController.text;
    String category = categoryController.text;
    String location = locationController.text;

    if (!isEditing) {
      Place place = new Place(
          name: name,
          description: desc,
          price: double.parse(price),
          imageUrl: imageUrl,
          category: category,
          location: location,
          code: code);
      await dbHelper.insertPlace(place);
    } else {
      _place.description = desc;
      _place.code = code;
      _place.name = name;
      _place.price = double.parse(price);
      _place.imageUrl = imageUrl;
      _place.category = category;
      _place.location = location;
      await dbHelper.updatePlace(_place);
    }
    Navigator.pop(context, true);
    resetData();
  }

  void resetData() {
    nameController.clear();
    descriptionController.clear();
    codeController.clear();
    priceController.clear();
    imageUrlController.clear();
    categoryController.clear();
    locationController.clear();
    isEditing = false;
  }

  // tambahkan method untuk memilih gambar dari galeri
  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        imageUrlController.text = imageFile!.path;
      });
    }
  }

  Widget build(BuildContext context) {
    nameController.text = widget._place.name;
    descriptionController.text = widget._place.description;
    codeController.text = widget._place.code ?? "";
    priceController.text = widget._place.price.toString();
    imageUrlController.text = widget._place.imageUrl as String;
    categoryController.text = widget._place.category;
    locationController.text = widget._place.location;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Place Page"),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: nameController,
                            decoration: const InputDecoration(
                                hintText: 'Enter Place name',
                                labelText: 'Name'),
                          ),
                          TextFormField(
                            controller: codeController,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            decoration: const InputDecoration(
                                hintText: 'Enter Place Code',
                                labelText: 'Code'),
                          ),
                          TextFormField(
                            controller: priceController,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'^\d+\.?\d{0,2}')),
                            ],
                            decoration: const InputDecoration(
                                hintText: 'Enter Place Price',
                                labelText: 'Price'),
                          ),
                          TextFormField(
                            controller: descriptionController,
                            decoration: const InputDecoration(
                                hintText: 'Enter Place Description',
                                labelText: 'Description'),
                          ),
                          TextFormField(
                            controller: imageUrlController,
                            decoration: const InputDecoration(
                              hintText: 'Enter Image URL',
                              labelText: 'Image URL',
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.0),
                                  child: ElevatedButton(
                                    onPressed: () =>
                                        pickImage(ImageSource.gallery),
                                    child: Text('Select Image from Gallery'),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.0),
                                  child: ElevatedButton(
                                    onPressed: () =>
                                        pickImage(ImageSource.camera),
                                    child: Text('Take a Picture'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          TextFormField(
                            controller: categoryController,
                            decoration: const InputDecoration(
                              hintText: 'Enter Category',
                              labelText: 'Category',
                            ),
                          ),
                          TextFormField(
                            controller: locationController,
                            decoration: const InputDecoration(
                              hintText: 'Enter Location',
                              labelText: 'Location',
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                child: ElevatedButton(
                                  child: Text('Submit'),
                                  onPressed: addOrEditPlace,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
