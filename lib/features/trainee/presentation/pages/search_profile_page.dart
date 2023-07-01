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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recherche'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (String value) {
                context.read<SearchBloc>().add(GetListUserEvent(value: value));
              },
              decoration: const InputDecoration(
                labelText: 'Rechercher un profile',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          BlocBuilder<SearchBloc, SearchState>(
              builder: (BuildContext context, SearchState state) {
            if (state is SearchSuccessState) {
              final List<UserEntity> usersList = state.usersListEntity;

              if (usersList.isEmpty) {
                return const Center(
                  child: Text('Aucun résultat trouvé.'),
                );
              } else {
                return Expanded(
                  child: ListView.builder(
                    itemCount: usersList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final UserEntity user = usersList[index];

                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(user.picture),
                        ),
                        title: Text(user.name),
                        subtitle: Text('Age: ${user.age}'),
                        onTap: () {
                          context.read<UserBloc>().add(GetUserEvent());

                          context.pushNamed('trainee', extra: user);
                        },
                      );
                    },
                  ),
                );
              }
            } else {
              return const Center(
                child: Text('Faites une recherche.'),
              );
            }
          }),
        ],
      ),
    );
  }
}
