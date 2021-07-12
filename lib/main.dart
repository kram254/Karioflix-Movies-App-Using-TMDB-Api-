import 'package:flutter/material.dart';
import 'package:retrofit_api/views/home.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.indigoAccent[400],
        ),
      home: HomeScreen(), 
      
    );
  }
}