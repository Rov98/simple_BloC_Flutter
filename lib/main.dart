import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_bloc/view/counter_View.dart';

import 'bloc/counter_Bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
          child: BlocProvider(
          create: (context) => counterBloc(),
          child: counterView(),
      )
        )
    );
  }
}
