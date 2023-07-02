import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:testcharliesolutions/features/home/domain/entities/user_entity.dart';
import 'package:testcharliesolutions/features/profile/presentation/bloc/profile_bloc.dart';

import '../../../home/presentation/widgets/card_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    var user = UserEntity(
        id: '',
        age: 0,
        picture: '',
        name: '',
        phone: '',
        locations: '',
        email: '');
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Profile', style: TextStyle(fontSize: screenHeight * 0.025)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          iconSize: screenHeight * 0.025,
          onPressed: () {
            context.pop();
          },
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: screenWidth * 0.05),
            child: IconButton(
              onPressed: () {
                context.pushNamed('/');
              },
              icon: const Icon(Icons.close),
              iconSize: screenHeight * 0.025,
            ),
          ),
        ],
      ),
      body: SizedBox(
        height: screenHeight * 0.80,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.008),
                child: Center(child: BlocBuilder<ProfileBloc, ProfileState>(
                  builder: (BuildContext context, ProfileState state) {
                    if (state is GetMyUserSuccessState) {
                      user = state.userEntity;
                      return UserCardWidget(user: state.userEntity);
                    } else {
                      return UserCardWidget(user: user);
                    }
                  },
                )),
              ),
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.02),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      context.pushNamed('modification_profile', extra: user);
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(screenHeight * 0.025),
                        ),
                        minimumSize:
                            Size(screenWidth * 0.1, screenHeight * 0.055)),
                    child: Padding(
                      padding: EdgeInsets.all(screenHeight * 0.01),
                      child: Text(
                        'Modifier',
                        style: TextStyle(fontSize: screenHeight * 0.025),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
