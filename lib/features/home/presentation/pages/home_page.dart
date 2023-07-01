import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:testcharliesolutions/features/profile/presentation/bloc/profile_bloc.dart';

import '../../../trainee/presentation/bloc/search_bloc.dart';
import '../bloc/user_bloc.dart';
import '../widgets/home_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          leading: Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () {
                context.read<ProfileBloc>().add(GetMyUserEvent());
                context.pushNamed('profile');
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenHeight * 0.024),
                child: const Text('Profile'),
              ),
            ),
          ),
          leadingWidth: screenWidth * 0.5,
          actions: [
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  context
                      .read<SearchBloc>()
                      .add(const GetListUserEvent(value: ''));
                  context.pushNamed('search_profile');
                },
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: screenHeight * 0.024),
                  child: const Text('Alternant'),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: screenHeight * 0.01),
                  child: const HomeWidget()),
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.05),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            context.read<UserBloc>().add(GetUserEvent());
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            padding: EdgeInsets.all(screenHeight * 0.02),
                          ),
                          child: const Icon(Icons.close)),
                      ElevatedButton(
                          onPressed: () {
                            context.read<UserBloc>().add(SendUserEvent());

                            context.read<UserBloc>().add(GetUserEvent());
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            padding: EdgeInsets.all(screenHeight * 0.02),
                          ),
                          child: const Icon(Icons.check)),
                    ]),
              )
            ]),
          ),
        ));
  }
}
