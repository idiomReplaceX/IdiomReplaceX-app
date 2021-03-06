import 'package:flutter/material.dart';

class AnimatedFlutterBrowserLogo extends StatefulWidget {
  final Duration animationDuration;
  final double size;

  AnimatedFlutterBrowserLogo({Key? key,
    this.animationDuration = const Duration(milliseconds: 1000),
    this.size = 100.0,
  }): super(key: key);

  @override
  State<StatefulWidget> createState() => _AnimatedFlutterBrowserLogoState();
}

class _AnimatedFlutterBrowserLogoState extends State<AnimatedFlutterBrowserLogo>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: widget.animationDuration, vsync: this);
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: Tween(begin: 1.0, end: 1.1).animate(CurvedAnimation(
          parent: _controller, curve: Curves.elasticOut)),
      child: SizedBox(
        height: widget.size,
        width: widget.size,
        child: CircleAvatar(
            backgroundImage: AssetImage("assets/icon/irx-logo.png"),
            backgroundColor: Colors.white
        ),
      ),
    );
  }
}