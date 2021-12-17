import 'package:flutter/material.dart';
import 'package:moyu_app/core/device_info.dart';
import 'package:moyu_app/models/system.dart';
import 'package:moyu_app/views/widgets/fancy_button.dart';

class SectionView extends StatefulWidget {
  const SectionView({Key? key}) : super(key: key);

  @override
  _SectionViewState createState() => _SectionViewState();
}

class _SectionViewState extends State<SectionView> {
  final _preferSystem = ValueNotifier(deviceInfo.os);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 45, horizontal: 15),
        child: ValueListenableBuilder(
            valueListenable: _preferSystem,
            builder: (context, System system, child) {
              return CustomScrollView(
                slivers: [
                  _sectionText,
                  _systemCheckList(system),
                  _moyuLiftButton(system)
                ],
              );
            }),
      ),
    );
  }

  Widget _moyuLiftButton(System? system) {
    return SliverToBoxAdapter(
      child: Visibility(
        visible: system == System.windows ||
            system == System.macos ||
            system == System.linux,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: const FancyButton(text: "进入摸鱼状态"),
        ),
      ),
    );
  }

  Widget _systemCheckList(System? os) => SliverToBoxAdapter(
        child: Column(
          children: [
            // windows tag
            _checkItem(os == System.windows, translateSystem(System.windows),
                (checked) {
              if (checked != null && checked) {
                _preferSystem.value = System.windows;
              }
            }),
            // MAC os
            _checkItem(os == System.macos, translateSystem(System.macos),
                (checked) {
              if (checked != null && checked) {
                _preferSystem.value = System.macos;
              }
            }),
            // Linux
            _checkItem(os == System.linux, translateSystem(System.linux),
                (checked) {
              if (checked != null && checked) {
                _preferSystem.value = System.linux;
              }
            })
          ],
        ),
      );

  Widget _checkItem(bool isChecked, String name, Function(bool?) onChanged) {
    return GestureDetector(
      onTap: () {
          onChanged(!isChecked);
        },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            border: isChecked ? Border.all(color: Colors.blue) : null,
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Checkbox(value: isChecked, onChanged: onChanged),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                name,
                style: const TextStyle(color: Colors.black, fontSize: 24),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget get _sectionText => const SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 25),
          child: Text(
            "请选择您的系统",
            style: TextStyle(color: Colors.grey, fontSize: 24),
          ),
        ),
      );
}
