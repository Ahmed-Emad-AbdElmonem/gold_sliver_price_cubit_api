import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gold_sliver_price/main_screen.dart';
import 'package:gold_sliver_price/network/dio_helper.dart';

void main() {
  
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gold & Sliver price',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(),
    );
  }
}
