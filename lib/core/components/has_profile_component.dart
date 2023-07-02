import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testcharliesolutions/features/home/presentation/bloc/user_bloc.dart';
import 'package:testcharliesolutions/features/profile/presentation/bloc/profile_bloc.dart';

import '../../features/home/presentation/pages/home_page.dart';
import '../../features/profile/presentation/pages/create_profile_page.dart';

class HasProfileComponent extends StatelessWidget {
  const HasProfileComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return auth(context);
  }
}

Widget auth(BuildContext context) {
  context.read<ProfileBloc>().add(const HasProfileEvent());
  return BlocBuilder<ProfileBloc, ProfileState>(
    builder: (BuildContext context, ProfileState state) {
      if (state is HasProfileState) {
        context.read<UserBloc>().add(GetUserEvent());
        return const HomePage();
      } else if (state is HasNotProfileState) {
        return const CreateProfilePage();
      } else {
        return Container();
      }
    },
  );
}
