import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:gombalan_maut/toast.dart';

class GombalanMaut extends StatefulWidget {
  const GombalanMaut({super.key});

  @override
  State<GombalanMaut> createState() => _GombalanMautState();
}

class _GombalanMautState extends State<GombalanMaut>
    with TickerProviderStateMixin {
  late GifController controllerGif;
  double _left = 0;
  double _top = 0;

  @override
  void initState() {
    controllerGif = GifController(vsync: this);
    super.initState();
  }

  void _moveButton(BoxConstraints constraints) {
    final random = Random();
    final newLeft =
        random.nextInt((constraints.maxWidth - 100).toInt()).toDouble();
    final newTop =
        random.nextInt((constraints.maxHeight - 50).toInt()).toDouble();

    setState(() {
      _left = newLeft;
      _top = newTop;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFFC0CB),
        body: SafeArea(
            child: Container(
          margin: const EdgeInsets.all(12),
          child: Column(
            children: [
              Expanded(
                  child: Column(
                children: [
                  Text("Halo Cantikk",
                      style: TextStyle(
                          color: Color(0xFF004080),
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Gif(
                    fps: 30,
                    autostart: Autostart.loop,
                    placeholder: (context) =>
                        const Center(child: CircularProgressIndicator()),
                    image: const NetworkImage(
                        'https://media4.giphy.com/media/yc2pHdAoxVOrJ2m5Ha/giphy.gif?cid=ecf05e47f0xamku9kmq2zss4u8iqnl29owzlk9embrp2ismi&rid=giphy.gif&ct=g'),
                  ),
                  const SizedBox(height: 12),
                  Text("Kamu mau jadi pacar aku ga??",
                      style: TextStyle(
                          color: Color(0xFF004080),
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ],
              )),
              Expanded(
                child: LayoutBuilder(builder: (context, constraints) {
                  return Row(
                    children: [
                      Flexible(
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            onPressed: () {
                              showToast(
                                  text: "I LOVE YOU!",
                                  state: ToastStates.SUCCESS);
                            },
                            child: Text("Mau"),
                          ),
                        ),
                      ),
                      Flexible(
                        child: LayoutBuilder(
                          builder: (context, innerConstraints) {
                            return Stack(
                              children: [
                                Positioned(
                                  left: _left,
                                  top: _top,
                                  child: ElevatedButton(
                                    onPressed: () =>
                                        _moveButton(innerConstraints),
                                    child: Text("Gamau"),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ],
          ),
        )));
  }
}
