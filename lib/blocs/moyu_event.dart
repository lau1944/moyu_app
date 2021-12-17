import 'package:moyu_app/models/system.dart';

abstract class MoyuEvent {}

class MoyuStarted extends MoyuEvent {
  final int time;
  final System os;

  MoyuStarted({required this.time, required this.os});
}

class MoyuProgressUpdated extends MoyuEvent {
  final int totalTime;
  final int progressTime;

  MoyuProgressUpdated(this.totalTime, this.progressTime);
}

class MoyuEnded extends MoyuEvent {
  MoyuEnded();
}
