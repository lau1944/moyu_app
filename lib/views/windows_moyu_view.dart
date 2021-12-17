import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:moyu_app/blocs/moyu_bloc.dart';
import 'package:moyu_app/blocs/moyu_event.dart';
import 'package:moyu_app/blocs/moyu_state.dart';
import 'package:moyu_app/models/system.dart';
import 'package:moyu_app/services/local.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class WindowsMoyuView extends StatefulWidget {
  const WindowsMoyuView({Key? key}) : super(key: key);

  @override
  _WindowsMoyuViewState createState() => _WindowsMoyuViewState();
}

class _WindowsMoyuViewState extends State<WindowsMoyuView> {
  late final _moyuBloc;
  final bool _isFullscreen = true;

  @override
  void initState() {
    super.initState();
    _moyuBloc = context.read<MoYuBloc>()
      ..add(MoyuStarted(time: settings.timer!, os: System.windows));
    DesktopWindow.setFullScreen(_isFullscreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff3275D0),
      body: Center(
        child: BlocConsumer<MoYuBloc, MoyuState>(
          builder: (context, state) {
            if (state is MoyuIng) {
              final progress = state.progress;

              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset('assets/lotties/windows_progress.json',
                      width: 155, height: 155),
                  const SizedBox(
                    height: 35,
                  ),
                  const Text(
                    '正在配置 Windows 更新',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  Text(
                    '已完成 ' +
                        ((progress > 0 ? progress.toInt() : 0) * 100)
                            .toString() +
                        ' % ',
                    style: const TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  const Text(
                    '请勿关闭计算机',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ],
              );
            }
            return const SizedBox();
          },
          listener: (context, state) {},
          listenWhen: (pre, cur) => pre != cur,
        ),
      ),
    );
  }
}
