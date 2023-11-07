import 'dart:typed_data';

class UserModel{

  final String? name;
  final String? country;
  final Uint8List? image;

  UserModel({
    required this.name,
    required this.country,
    required this.image,
  });

  factory UserModel.formMap(Map<String, dynamic> json) => UserModel(
      name: json['name'] as String,
      country: json['country'] as String,
      image: json['image'],
  );

  Map<String, dynamic> toMap() {
    var map = {
      "name" : name,
      "country" : country,
      "image" : image,
    };
    return map;
  }

  @override
  String toString() {
    return 'Travel{name: $name, country: $country, image: $image}';
  }
}