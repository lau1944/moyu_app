import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

class FancyButton extends StatelessWidget {
  final String text;
  final double? width;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final Color? textColor;
  final VoidCallback? onTaped;

  const FancyButton(
      {required this.text,
      this.width,
      this.backgroundColor,
      this.textColor,
      this.textStyle,
      this.onTaped,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
        width: width ?? 155,
        text: text,
        backgroundColor: Colors.blue,
        borderRadius: 15,
        textStyle: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        onPress: onTaped ?? () {});
  }
}
