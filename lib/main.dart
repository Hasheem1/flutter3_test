import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter3_test/secondLecture/product_screen.dart';
import 'package:flutter3_test/secondLecture/screens/nav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home:  NavScreen(),
    );
  }
}