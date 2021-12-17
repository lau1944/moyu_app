import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moyu_app/blocs/moyu_bloc.dart';
import 'package:moyu_app/views/splash_view.dart';

class MoyuApp extends StatefulWidget {
  const MoyuApp({ Key? key }) : super(key: key);

  @override
  _MoyuAppState createState() => _MoyuAppState();
}

class _MoyuAppState extends State<MoyuApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MoYuBloc>(
      create: (context) => MoYuBloc(),
      child: const MaterialApp(
          home: SplashView(),
        )
    );
  }
}