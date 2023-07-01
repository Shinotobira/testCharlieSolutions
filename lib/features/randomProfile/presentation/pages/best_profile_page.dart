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
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text('Profile'),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: screenWidth * 0.05),
            child: InkWell(
                onTap: () {
                  context.pushNamed('/');
                },
                child: const Icon(Icons.close)),
          ),
        ],
      ),
      body: Center(
        child: UserCardWidget(
          user: user,
        ),
      ),
    );
  }
}
