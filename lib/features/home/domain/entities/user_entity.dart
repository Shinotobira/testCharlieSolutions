import 'package:equatable/equatable.dart';

import '../../data/models/user_modele.dart';

class UserEntity extends Equatable {
  UserEntity(
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

  @override
  List<Object?> get props => <Object>[
        name,
        locations,
        email,
        age,
        phone,
        id,
        picture,
      ];

  UserModel toModel() {
    return UserModel(
      id: id,
      age: age,
      picture: picture,
      name: name,
      phone: phone,
      locations: locations,
      email: email,
    );
  }
}
