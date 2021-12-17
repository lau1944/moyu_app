import 'package:moyu_app/models/system.dart';

abstract class MoyuEvent {}

class MoyuStarted extends MoyuEvent {
  final num time;
  final System os;

  MoyuStarted({required this.time, required this.os});
}

class MoyuEnded extends MoyuEvent {
  MoyuEnded();
}