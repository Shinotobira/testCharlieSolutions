import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testcharliesolutions/features/profile/presentation/bloc/profile_bloc.dart';

class ProfileCardWidget extends StatelessWidget {
  const ProfileCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: screenHeight * 0.7,
      width: screenWidth * 0.80,
      child: Card(
        child: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (BuildContext context, ProfileState state) {
          if (state is GetMyUserSuccessState) {
            return Column(
              children: [
                if (state.userEntity.picture.isEmpty)
                  Padding(
                    padding: EdgeInsets.only(
                        top: screenHeight * 0.04, bottom: screenHeight * 0.02),
                    child: Center(
                      child: Container(
                        width: screenHeight * 0.15,
                        height: screenHeight * 0.15,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        child: Icon(
                          Icons.person,
                          size: screenHeight * 0.1,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                else
                  Padding(
                    padding: EdgeInsets.only(
                        top: screenHeight * 0.06, bottom: screenHeight * 0.02),
                    child: Center(
                      child: SizedBox(
                          width: screenHeight * 0.15,
                          height: screenHeight * 0.15,
                          child: ClipOval(
                              child: Image.network(
                            state.userEntity.picture,
                            fit: BoxFit.cover,
                          ))),
                    ),
                  ),
                Center(child: Text(state.userEntity.name)),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: screenHeight * 0.01, top: screenHeight * 0.04),
                    child: Text('Age: ${state.userEntity.age}'),
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
                        child: Text('Adresse: ${state.userEntity.email}'))),
              ],
            );
          } else {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: screenHeight * 0.04, bottom: screenHeight * 0.02),
                  child: Center(
                    child: Container(
                      width: screenHeight * 0.15,
                      height: screenHeight * 0.15,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      child: Icon(
                        Icons.person,
                        size: screenHeight * 0.1,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const Center(child: Text('nAn nAn')),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: screenHeight * 0.01, top: screenHeight * 0.04),
                    child: const Text('Age: nAn'),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: screenHeight * 0.01, top: screenHeight * 0.04),
                    child: const Text('Numéro: nAn'),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: screenHeight * 0.01, top: screenHeight * 0.04),
                    child: const Text('Email: nAn'),
                  ),
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: screenHeight * 0.01,
                            top: screenHeight * 0.04),
                        child: const Text('Adresse: nAn'))),
              ],
            );
          }
        }),
      ),
    );
  }
}
