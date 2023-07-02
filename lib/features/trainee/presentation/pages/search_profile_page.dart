import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:testcharliesolutions/features/trainee/presentation/bloc/search_bloc.dart';

import '../../../home/domain/entities/user_entity.dart';
import '../../../home/presentation/bloc/user_bloc.dart';

class SearchProfilePage extends StatelessWidget {
  const SearchProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          iconSize: screenHeight * 0.025,
          onPressed: () {
            context.pop();
          },
        ),
        title: Text(
          'Recherche',
          style: TextStyle(fontSize: screenHeight * 0.025),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(screenHeight * 0.02),
            child: TextField(
              style: TextStyle(fontSize: screenHeight * 0.022),
              onChanged: (String value) {
                context.read<SearchBloc>().add(GetListUserEvent(value: value));
              },
              decoration: InputDecoration(
                labelText: 'Rechercher un profile',
                prefixIcon: Icon(Icons.search, size: screenHeight * 0.035),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(screenHeight * 0.025),
                ),
              ),
            ),
          ),
          BlocBuilder<SearchBloc, SearchState>(
              builder: (BuildContext context, SearchState state) {
            if (state is SearchSuccessState) {
              final List<UserEntity> usersList = state.usersListEntity;

              if (usersList.isEmpty) {
                return Center(
                  child: Text('Aucun résultat trouvé.',
                      style: TextStyle(fontSize: screenHeight * 0.025)),
                );
              } else {
                return Expanded(
                  child: ListView.builder(
                    itemCount: usersList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final UserEntity user = usersList[index];

                      return Padding(
                        padding: EdgeInsets.only(bottom: screenHeight * 0.02),
                        child: ListTile(
                          leading: ClipOval(
                            child: Image.network(
                              width: screenHeight * 0.065,
                              height: screenHeight * 0.065,
                              user.picture,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(user.name,
                              style: TextStyle(fontSize: screenHeight * 0.025)),
                          subtitle: Text('Age: ${user.age}',
                              style: TextStyle(fontSize: screenHeight * 0.020)),
                          onTap: () {
                            context.read<UserBloc>().add(GetUserEvent());
                            context.pushNamed('trainee', extra: user);
                          },
                        ),
                      );
                    },
                  ),
                );
              }
            } else {
              return Center(
                child: Text('Faites une recherche.',
                    style: TextStyle(fontSize: screenHeight * 0.020)),
              );
            }
          }),
        ],
      ),
    );
  }
}
