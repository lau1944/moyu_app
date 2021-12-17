import 'package:flutter/material.dart';
import 'package:moyu_app/views/splash_view.dart';

class MoyuApp extends StatefulWidget {
  const MoyuApp({ Key? key }) : super(key: key);

  @override
  _MoyuAppState createState() => _MoyuAppState();
}

class _MoyuAppState extends State<MoyuApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashView(),
    );
  }
}