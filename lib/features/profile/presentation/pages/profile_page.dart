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
                    child: const Text('Modifier'),
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
