import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:testcharliesolutions/features/home/domain/entities/user_entity.dart';
import 'package:testcharliesolutions/features/home/presentation/widgets/card_widget.dart';

class BestProfilePage extends StatelessWidget {
  const BestProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    UserEntity user = UserEntity(
        id: "2",
        age: 20,
        picture: 'assets/images/best.jpg',
        name: 'Parent Anthony',
        phone: '0617215108',
        locations: '70 rue Claude Perrier, Herin',
        email: 'anthonyparent02@gmail.com');

    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Profile',
            style: TextStyle(fontSize: screenHeight * 0.025),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: screenWidth * 0.02),
              child: IconButton(
                onPressed: () {
                  context.pushNamed('home');
                },
                icon: const Icon(Icons.close),
                iconSize: screenHeight * 0.025,
              ),
            ),
          ],
        ),
        body: Center(
          child: UserCardWidget(
            user: user,
          ),
        ),
      ),
    );
  }
}
