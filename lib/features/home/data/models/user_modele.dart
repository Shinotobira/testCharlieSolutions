import 'dart:math';

import '../../domain/entities/user_entity.dart';

class UserModel {
  UserModel(
      {required this.id,
      required this.age,
      required this.picture,
      required this.name,
      required this.phone,
      required this.locations,
      required this.email});

  String id;
  int age;
  String picture;
  String name;
  String phone;
  String email;
  String locations;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id']['value'] != null
          ? json['id']['value'] as String
          : generateRandomString(10),
      age: json['dob']['age'] as int,
      picture: json['picture']['medium'] as String,
      name: '${json['name']['first']} ${json['name']['last']}',
      phone: json['phone'] as String,
      locations:
          "${json['location']['street']['number']} ${json['location']['street']['name']} , ${json['location']['city']}",
      email: json['email'] as String,
    );
  }

  factory UserModel.fromJson2(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      age: json['age'] as int,
      picture: json['image'] as String,
      name: json['name'] as String,
      phone: json['phoneNumber'] as String,
      locations: json['address'] as String,
      email: json['email'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'age': age,
      'image': picture,
      'name': name,
      'phoneNumber': phone,
      'address': locations,
      'email': email,
    };
  }

  UserEntity toEntity() {
    return UserEntity(
        id: id,
        age: age,
        picture: picture,
        name: name,
        phone: phone,
        locations: locations,
        email: email);
  }
}

String generateRandomString(int length) {
  final Random random = Random();
  const String characters =
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';

  String result = '';
  for (int i = 0; i < length; i++) {
    final int randomIndex = random.nextInt(characters.length);
    result += characters[randomIndex];
  }

  return result;
}
