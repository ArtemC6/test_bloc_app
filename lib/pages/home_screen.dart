import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc_app/bloc/user_bloc.dart';
import 'package:test_bloc_app/services/user_repository.dart';

import '../widgets/action_button.dart';
import '../widgets/user_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

final usersRepository = UserRepository();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      create: (context) => UserBloc(usersRepository: usersRepository),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              ActionButton(),
              Expanded(child: UserList()),
            ],
          ),
        ),
      ),
    );
  }
}
