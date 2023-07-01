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
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(screenHeight * 0.04),
        ),
        child: Column(
          children: [
            if (user.picture.isEmpty)
              Padding(
                padding: EdgeInsets.only(
                    top: screenHeight * 0.06, bottom: screenHeight * 0.02),
                child: Center(
                  child: Container(
                    width: screenHeight * 0.2,
                    height: screenHeight * 0.2,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: Icon(
                      Icons.person,
                      size: screenHeight * 0.1,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            else
              Padding(
                padding: EdgeInsets.only(
                    top: screenHeight * 0.06, bottom: screenHeight * 0.02),
                child: Center(
                  child: SizedBox(
                      width: screenHeight * 0.2,
                      height: screenHeight * 0.2,
                      child: ClipOval(
                          child: Image.network(
                        user.picture,
                        fit: BoxFit.cover,
                      ))),
                ),
              ),
            Center(child: Text(user.name)),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                    left: screenHeight * 0.01, top: screenHeight * 0.06),
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
