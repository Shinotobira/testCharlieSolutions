import '../../domain/entities/user_entity.dart';

class UserModel {
  UserModel(
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

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id']['value'] as String,
      dob: json['dob']['age'] as int,
      picture: json['picture']['medium'] as String,
      name: '${json['name']['first']} ${json['name']['last']}',
      phone: json['phone'] as String,
      locations:
          "${json['location']['street']['number']} ${json['location']['street']['name']} , ${json['location']['city']}",
      email: json['email'] as String,
    );
  }

  UserEntity toEntity() {
    return UserEntity(
        id: id,
        dob: dob,
        picture: picture,
        name: name,
        phone: phone,
        locations: locations,
        email: email);
  }
}
