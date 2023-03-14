import 'package:flutter/material.dart';
import 'package:chowdrop/home/chowdrop_main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ChowDrop",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MainChowDropPage(),
    );
  }
}
