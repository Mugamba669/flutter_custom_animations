import 'package:flutter/material.dart';

class SkeletonAnimation extends StatefulWidget {
  const SkeletonAnimation({super.key});

  @override
  State<SkeletonAnimation> createState() => _SkeletonAnimationState();
}

class _SkeletonAnimationState extends State<SkeletonAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _loadingAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    // animation settings
    _loadingAnimation = Tween<double>(begin: 0.2, end: 1).animate(_controller!);
    _controller?.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: AnimatedBuilder(
            animation: _loadingAnimation!,
            builder: (context, widget) {
              return Opacity(
                opacity: _loadingAnimation!.value,
                child: ListView.separated(
                    itemBuilder: (context, i) => ListTile(
                          leading: Card(
                            elevation: 0,
                            color: Colors.grey.shade300,
                            child: SizedBox(
                              width: 50,
                              height: 50,
                            ),
                          ),
                          title: Card(
                            color: Colors.grey.shade300,
                            elevation: 0,
                            child: SizedBox(height: 40),
                          ),
                          subtitle: Card(
                            color: Colors.grey.shade300,
                            elevation: 0,
                            child: SizedBox(height: 10, width: 0),
                          ),
                        ),
                    separatorBuilder: (context, i) => const SizedBox(height: 0),
                    itemCount: 10),
              );
            }),
      ),
    );
  }
}
