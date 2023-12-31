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
              Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(screenHeight * 0.04)),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: screenHeight * 0.06,
                          bottom: screenHeight * 0.02),
                      child: Center(
                        child: Container(
                          width: screenHeight * 0.2,
                          height: screenHeight * 0.2,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Icon(
                            Icons.person,
                            size: screenHeight * 0.1,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: screenHeight * 0.02),
                      child: Center(
                          child: Text(
                        user.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: screenHeight * 0.03),
                      )),
                    ),
                  ],
                ),
              )
            else if (user.picture != "assets/images/best.jpg")
              Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(screenHeight * 0.04)),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: screenHeight * 0.06,
                          bottom: screenHeight * 0.02),
                      child: SizedBox(
                        width: screenHeight * 0.2,
                        height: screenHeight * 0.2,
                        child: ClipOval(
                          child: Image.network(
                            user.picture,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: screenHeight * 0.02),
                      child: Center(
                          child: Text(
                        user.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: screenHeight * 0.03),
                      )),
                    ),
                  ],
                ),
              )
            else
              Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(screenHeight * 0.04)),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: screenHeight * 0.06,
                          bottom: screenHeight * 0.02),
                      child: Center(
                        child: SizedBox(
                          width: screenHeight * 0.2,
                          height: screenHeight * 0.2,
                          child: ClipOval(
                            child: Image.asset(
                              user.picture,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: screenHeight * 0.02),
                      child: Center(
                          child: Text(
                        user.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: screenHeight * 0.03),
                      )),
                    ),
                  ],
                ),
              ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                    left: screenHeight * 0.02,
                    right: screenHeight * 0.02,
                    top: screenHeight * 0.04),
                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_month,
                      size: screenHeight * 0.030,
                    ),
                    Flexible(
                      child: Text(
                        ': ${user.age} ans',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: screenHeight * 0.022),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                    left: screenHeight * 0.02,
                    right: screenHeight * 0.02,
                    top: screenHeight * 0.04),
                child: Row(
                  children: [
                    Icon(
                      Icons.phone,
                      size: screenHeight * 0.030,
                    ),
                    Flexible(
                      child: Text(
                        ': ${user.phone}',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: screenHeight * 0.022),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                    left: screenHeight * 0.02,
                    right: screenHeight * 0.02,
                    top: screenHeight * 0.04),
                child: Row(
                  children: [
                    Icon(
                      Icons.email,
                      size: screenHeight * 0.030,
                    ),
                    Flexible(
                      child: Text(
                        ': ${user.email}',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: screenHeight * 0.022),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                    left: screenHeight * 0.02,
                    right: screenHeight * 0.02,
                    top: screenHeight * 0.04),
                child: Row(
                  children: [
                    Icon(
                      Icons.home,
                      size: screenHeight * 0.030,
                    ),
                    Flexible(
                      child: Text(
                        ': ${user.locations}',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: screenHeight * 0.022),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
