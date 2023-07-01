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

    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
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
                            context.pushNamed('/');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: const CircleBorder(),
                            padding: EdgeInsets.all(screenHeight * 0.02),
                          ),
                          child: const Icon(Icons.close)),
                    ]),
              )
            ]),
          ),
        ));
  }
}
