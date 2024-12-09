import 'package:flutter/material.dart';
import 'package:gombalan_maut/gombalan_maut.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gombalan Maut',
      home: GombalanMaut(),
    );
  }
}
