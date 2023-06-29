import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testcharliesolutions/features/home/presentation/bloc/user_bloc.dart';

class UserCardWidget extends StatelessWidget {
  const UserCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<UserBloc, UserState>(
      builder: (BuildContext context, UserState state) {
        if (state is GetUserInitialState) {
          return Container();
        } else if (state is GetUserSuccessState) {
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
                      backgroundImage: NetworkImage(state.userEntity.picture),
                    ),
                  ),
                  Center(child: Text(state.userEntity.name)),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: screenHeight * 0.01, top: screenHeight * 0.04),
                      child: Text('Age: ${state.userEntity.dob}'),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: screenHeight * 0.01, top: screenHeight * 0.04),
                      child: Text('Numéro: ${state.userEntity.phone}'),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: screenHeight * 0.01, top: screenHeight * 0.04),
                      child: Text('Email: ${state.userEntity.email}'),
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(
                              left: screenHeight * 0.01,
                              top: screenHeight * 0.04),
                          child:
                              Text('Adresse: ${state.userEntity.locations}'))),
                ],
              ),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
