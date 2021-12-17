import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moyu_app/views/widgets/fancy_button.dart';

class ReplayView extends StatelessWidget {
  final VoidCallback onReplay;

  const ReplayView({required this.onReplay, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '摸鱼结束 ～-～',
          style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 24),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: MaterialButton(
            child: Text(
              '再来一次? ?',
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 20
              ),
            ),
            onPressed: onReplay,
          ),
        )
      ],
    );
  }
}
