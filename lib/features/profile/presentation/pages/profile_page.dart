import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/profile_card_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
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
      body: SizedBox(
        height: screenHeight * 0.80,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.008),
              child: const Center(child: ProfileCardWidget()),
            ),
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.02),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    context.pushNamed('modification_profile');
                  },
                  child: const Text('Modifier'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
