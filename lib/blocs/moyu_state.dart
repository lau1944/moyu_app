abstract class MoyuState {}

class MoyuInit extends MoyuState {}

class MoyuIng extends MoyuState {
  final double progress;
  final int progressTime;

  MoyuIng({required this.progress, required this.progressTime});
}

class MoyuFinish extends MoyuState {}
