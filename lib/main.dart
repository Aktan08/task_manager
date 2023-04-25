import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/repo/userRepozitor.dart';
import 'package:task_manager/screens/startscreen.dart';
import 'bloc/regis_bloc.dart';
import 'dio_settings.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => DioSettings(),
        ),
        RepositoryProvider(
          create: (context) =>
              UserRepo(dio: RepositoryProvider.of<DioSettings>(context).dio),
        ),
      ],
      child: BlocProvider(
        create: (context) => RegisBloc(
          repo: RepositoryProvider.of<UserRepo>(context),
        ),
        child: const MaterialApp(
          home: App(),
        ),
      ),
    );
  }
}
