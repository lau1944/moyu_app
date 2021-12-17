import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moyu_app/blocs/moyu_bloc.dart';
import 'package:moyu_app/blocs/moyu_event.dart';
import 'package:moyu_app/blocs/moyu_state.dart';
import 'package:moyu_app/models/system.dart';
import 'package:moyu_app/services/local.dart';
import 'package:moyu_app/views/widgets/replay_view.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MacMoyuView extends StatefulWidget {
  const MacMoyuView({Key? key}) : super(key: key);

  @override
  _MacMoyuViewState createState() => _MacMoyuViewState();
}

class _MacMoyuViewState extends State<MacMoyuView> {
  late final _moyuBloc;
  final bool _isFullscreen = true;

  @override
  void initState() {
    super.initState();
    _moyuBloc = context.read<MoYuBloc>()
      ..add(MoyuStarted(time: settings.timer!, os: System.macos));
    DesktopWindow.setFullScreen(_isFullscreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          width: 200,
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 45),
                child: Image.asset(
                  'assets/images/ic_apple.png',
                  color: Colors.white,
                  width: 70,
                  height: 70,
                ),
              ),
              BlocConsumer<MoYuBloc, MoyuState>(
                builder: (context, state) {
                  if (state is MoyuIng) {
                    final progress = state.progress;

                    return LinearPercentIndicator(
                      percent: progress,
                      backgroundColor: Colors.grey.withOpacity(0.5),
                      progressColor: Colors.white,
                    );
                  } else if (state is MoyuFinish) {
                    return ReplayView(onReplay: () {
                      _replay();
                    });
                  }
                  return const SizedBox();
                },
                listener: (context, state) {},
                listenWhen: (pre, cur) => pre != cur,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _replay() {
    _moyuBloc.add(MoyuStarted(time: settings.timer!, os: System.macos));
  }
}
