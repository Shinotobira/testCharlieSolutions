import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  UserEntity(
      {required this.id,
      required this.dob,
      required this.picture,
      required this.name,
      required this.phone,
      required this.locations,
      required this.email});

  String id;
  int dob;
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
        dob,
        phone,
        id,
        picture,
      ];
}
