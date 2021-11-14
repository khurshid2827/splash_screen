import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_splash_screen/screens/datapage.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          "assets/my_lottie.json",
          width: 200,
          height: 200,
          controller: _controller,
          onLoaded: (composition) {
            _controller
              ..duration = const Duration(seconds: 3) //composition.duration
              ..forward().then((value) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DataPage(),
                  ),
                );
              });
          },
        ),
      ),
    );
  }
}
