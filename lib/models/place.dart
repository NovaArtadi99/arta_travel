import 'package:image_picker/image_picker.dart';

class Place {
  int? id;
  String name;
  String description;
  double price;
  String? imageUrl;
  String category;
  String location;
  String? code;

  Place({
    this.id,
    required this.name,
    required this.description,
    required this.price,
    this.imageUrl,
    required this.category,
    required this.location,
    this.code,
  });

  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageUrl = pickedFile.path;
    }
  }

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'category': category,
      'location': location,
      'code': code ?? '',
      'imageUrl': imageUrl,
    };
  }

  factory Place.fromMap(Map<String, Object?> map) {
    return Place(
      id: map['id'] as int?,
      name: map['name'] as String,
      description: map['description'] as String,
      price: map['price'] as double,
      imageUrl: map['imageUrl'] as String?,
      category: map['category'] as String,
      location: map['location'] as String,
      code: map['code'] as String?,
    );
  }
}
