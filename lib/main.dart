import 'dart:developer';

import 'package:app/SkeletonAnimation.dart';
import 'package:flutter/material.dart';

import 'FadeAnimation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Animations'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const FadeAnimation())),
                child: Text("Fade Animation")),
          ),
          const SizedBox(height: 100),
          ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const SkeletonAnimation()),
                  ),
              child: Text("Skeleton Animation")),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
