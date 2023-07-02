import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testcharliesolutions/features/home/presentation/bloc/user_bloc.dart';

import 'card_widget.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<UserBloc, UserState>(
      builder: (BuildContext context, UserState state) {
        if (state is GetUserSuccessState) {
          return UserCardWidget(
            user: state.userEntity,
          );
        } else {
          return SizedBox(
              height: screenHeight * 0.7,
              child: const Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
