import 'package:flutter/material.dart';

Route<T> routeConstrutor<T>(Widget target) {
  return MaterialPageRoute(builder: (context) {
    return target;
  });
}
