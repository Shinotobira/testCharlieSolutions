import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:testcharliesolutions/features/home/domain/entities/user_entity.dart';

import '../../../home/presentation/widgets/card_widget.dart';
import '../bloc/search_bloc.dart';

class TraineePage extends StatelessWidget {
  const TraineePage({required this.user, super.key});

  final UserEntity user;
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title:
              Text('Profile', style: TextStyle(fontSize: screenHeight * 0.025)),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            iconSize: screenHeight * 0.025,
            onPressed: () {
              context.read<SearchBloc>().add(const GetListUserEvent(value: ''));
              context.pop();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: screenHeight * 0.01),
                  child: UserCardWidget(
                    user: user,
                  )),
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.05),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          context
                              .read<SearchBloc>()
                              .add(DeleteMatchEvent(id: user.id));
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(screenHeight * 0.04),
                              ),
                              behavior: SnackBarBehavior.floating,
                              width: screenWidth * 0.8,
                              content:
                                  const Text("Cet alternant a été supprimé")));
                          context.pushNamed('home');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: const CircleBorder(),
                          padding: EdgeInsets.all(screenHeight * 0.02),
                        ),
                        child: Icon(
                          Icons.close,
                          size: screenHeight * 0.035,
                        ),
                      ),
                    ]),
              )
            ]),
          ),
        ));
  }
}
