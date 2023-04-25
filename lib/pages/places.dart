import 'dart:io';
import 'package:flutter/material.dart';
import 'package:travel/models/place.dart';
import 'package:travel/pages/addplaces.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel/services/databasehelper.dart';

class PlacesPage extends StatefulWidget {
  const PlacesPage({Key? key}) : super(key: key);

  @override
  _PlacesPageState createState() => _PlacesPageState();
}

class _PlacesPageState extends State<PlacesPage> {
  late final DatabaseHelper dbHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    dbHelper.initDB().whenComplete(() async {
      setState(() {});
    });
  }

  Future<void> _deletePlace(int? id) async {
    await dbHelper.deletePlace(id!);
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageUrl = pickedFile.path;
      });
    }
  }

  String? _imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Places"),
      ),
      body: _buildPlaceList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final Place newPlace = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return PlaceAdd(
                Place(
                  id: null,
                  name: "",
                  location: "",
                  description: "",
                  price: 0,
                  imageUrl: "",
                  category: "",
                  code: "",
                ),
                onImageSelected: (File image) {
                  setState(() {
                    _imageUrl = image.path;
                  });
                },
                place: null,
              );
            }),
          );
          if (newPlace != null) {
            await dbHelper.insertPlace(newPlace);
            setState(() {});
          }
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildPlaceList() {
    return FutureBuilder<List<Place>>(
      future: dbHelper.retrievePlaces(),
      builder: (BuildContext context, AsyncSnapshot<List<Place>> snapshot) {
        if (snapshot.hasData) {
          final List<Place> places = snapshot.data!;
          return ListView.builder(
            itemCount: places.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                key: UniqueKey(),
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Icon(Icons.delete_forever),
                ),
                direction: DismissDirection.endToStart,
                onDismissed: (_) async {
                  await _deletePlace(places[index].id);
                  setState(() {});
                },
                child: ListTile(
                  onTap: () async {
                    final Place updatedPlace = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return PlaceAdd(
                          places[index],
                          onImageSelected: (File image) {
                            setState(() {
                              _imageUrl = image.path;
                            });
                          },
                          place: null,
                        );
                      }),
                    );
                    if (updatedPlace != null) {
                      await dbHelper.updatePlace(updatedPlace);
                      setState(() {});
                    }
                  },
                  leading: CircleAvatar(
                    backgroundImage: places[index].imageUrl != null
                        ? FileImage(File(places[index].imageUrl!))
                        : null,
                  ),
                  title: Text(places[index].name),
                  subtitle: Text(places[index].location),
                ),
              );
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
