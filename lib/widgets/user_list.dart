import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc_app/bloc/user_bloc.dart';
import 'package:test_bloc_app/bloc/user_state.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserEmptyState) {
          return Center(
            child: Text('No data'),
          );
        }
        if (state is UserLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is UserLoadedState) {
          return ListView.builder(
              itemCount: state.loadedUser.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text(
                    'Id: ${state.loadedUser[index].id}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  title: Column(
                    children: [
                      Text(
                        '${state.loadedUser[index].name}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Column(
                        children: [
                          Text(
                            'Email: ${state.loadedUser[index].email}',
                            style: TextStyle(fontWeight: FontWeight.normal),
                          ),
                          Text(
                            'Phone: ${state.loadedUser[index].phone}',
                            style: TextStyle(fontWeight: FontWeight.normal),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              });
        }
        if (state is UserEmptyState) {
          return Center(
            child: Text('Error fetching user'),
          );
        }
        return Container();
      },
    );
  }
}
