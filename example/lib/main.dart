import 'package:example/home/bloc/home_bloc.dart';
import 'package:example/home/repository/home_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'home/pages/home_page.dart';

void main() {
  runApp(MoneyTrackerApp(
    homeRepository: HomeImpl(),
  ));
}

class MoneyTrackerApp extends StatelessWidget {
  final HomeRepository homeRepository;

  const MoneyTrackerApp({required this.homeRepository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(homeRepository),
      child: MaterialApp(
        title: "Flutterwave app using package",
        home: HomePage(),
      ),
    );
  }
}
