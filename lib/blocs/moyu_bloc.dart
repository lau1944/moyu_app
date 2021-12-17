import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moyu_app/blocs/moyu_event.dart';
import 'package:moyu_app/blocs/moyu_state.dart';

class MoYuBloc extends Bloc<MoyuEvent, MoyuState> {
  Timer? _timer;

  MoYuBloc() : super(MoyuInit()) {
    on(_handleMoyuStart);
    on(_handleUpdateProgress);
    on(_handleMoyuEnd);
  }

  // handle clock update
  FutureOr<void> _handleUpdateProgress(
      MoyuProgressUpdated event, Emitter<MoyuState> emit) async {
    final totalTime = event.totalTime;
    final progressTime = event.progressTime;
    emit(
      MoyuIng(progress: progressTime / totalTime, progressTime: progressTime),
    );
  }

  // handle moyu start action
  FutureOr<void> _handleMoyuStart(
      MoyuStarted event, Emitter<MoyuState> emit) async {
    if (_timer != null && _timer!.isActive) {
      _timer?.cancel();
    }

    final totalTime = event.time;
    int progressTime = state is MoyuIng ? (state as MoyuIng).progressTime : 0;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      add(MoyuProgressUpdated(totalTime, ++progressTime));

      if (progressTime >= totalTime) {
        timer.cancel();
        add(MoyuEnded());
      }
    });
    emit(MoyuIng(progress: 0, progressTime: 0));
  }

  // handle clock end
  FutureOr<void> _handleMoyuEnd(
      MoyuEnded event, Emitter<MoyuState> emit) async {
    emit(MoyuFinish());
  }
}
