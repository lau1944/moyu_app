import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: _welcomeText,
          ),
          _startButton
        ],
      ),
    );
  }

  Widget get _startButton => Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.all(15),
        child: AnimatedButton(
            width: 155,
            text: '开始吧~',
            backgroundColor: Colors.blue,
            borderRadius: 15,
            textStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
            onPress: () {}),
      );

  Widget get _welcomeText => Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              '欢迎来到',
              style: TextStyle(color: Colors.black, fontSize: 26),
            ),
            Row(
              children: [
                Text(
                  '摸鱼',
                  style: TextStyle(
                      color: Colors.grey.withOpacity(0.5), fontSize: 16),
                ),
                Text(
                  'app',
                  style: TextStyle(
                      color: Colors.grey.withOpacity(0.5), fontSize: 12),
                )
              ],
            )
          ],
        ),
      );
}
