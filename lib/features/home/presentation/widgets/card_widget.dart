import 'package:flutter/material.dart';

import '../../domain/entities/user_entity.dart';

class UserCardWidget extends StatelessWidget {
  const UserCardWidget({
    super.key,
    required this.user,
  });
  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: screenHeight * 0.7,
      width: screenWidth * 0.80,
      child: Card(
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.3,
              child: CircleAvatar(
                radius: screenHeight * 0.10,
                backgroundImage: NetworkImage(user.picture),
              ),
            ),
            Center(child: Text(user.name)),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                    left: screenHeight * 0.01, top: screenHeight * 0.04),
                child: Text('Age: ${user.age}'),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                    left: screenHeight * 0.01, top: screenHeight * 0.04),
                child: Text('Numéro: ${user.phone}'),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                    left: screenHeight * 0.01, top: screenHeight * 0.04),
                child: Text('Email: ${user.email}'),
              ),
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding: EdgeInsets.only(
                        left: screenHeight * 0.01, top: screenHeight * 0.04),
                    child: Text('Adresse: ${user.locations}'))),
          ],
        ),
      ),
    );
  }
}
