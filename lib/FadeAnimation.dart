import 'dart:developer';

import 'package:flutter/material.dart';

class FadeAnimation extends StatefulWidget {
  const FadeAnimation({super.key});

  @override
  State<FadeAnimation> createState() => _FadeAnimationState();
}

class _FadeAnimationState extends State<FadeAnimation>
    with TickerProviderStateMixin {
  Animation<double>? _animation;
  AnimationController? _controller;
  AnimationController? _spinController;
  Animation<double>? _bounceAnimation;
  Animation<double>? _spinAnimation;
  @override
  void initState() {
    super.initState();
    // controller logic
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _spinController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));

    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controller!);
    // bounce
    _bounceAnimation =
        CurveTween(curve: Curves.bounceInOut).animate(_controller!);
    _spinAnimation = Tween<double>(
      begin: -358,
      end: 358,
    ).animate(_spinController!);
    // start the animation
    _controller?.forward();
    _spinController?.forward();
  }

  @override
  void dispose() {
    _controller?.dispose();
    _spinController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: AnimatedBuilder(
        builder: (context, widget) {
          log('FadeAnimation ${_animation!.value}');
          return AnimatedBuilder(
            builder: (context, widget) {
              return AnimatedBuilder(
                builder: (context, w) {
                  log("SpinAnimation ${_spinAnimation!.value}");
                  return Transform.rotate(
                    angle: _spinAnimation!.value,
                    child: Transform.scale(
                      scale: 1 + _animation!.value,
                      child: Opacity(
                        opacity: _animation!.value,
                        child: const Center(
                          child: FlutterLogo(
                            size: 150,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                animation: _spinAnimation!,
              );
            },
            animation: _bounceAnimation!,
          );
        },
        animation: _animation!,
      ),
    );
  }
}
