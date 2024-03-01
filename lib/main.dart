import 'package:bakimmodul/homepage.dart';
import 'package:bakimmodul/loginpage.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      theme: ThemeData.dark().copyWith(appBarTheme: AppBarTheme(centerTitle:true,backgroundColor: Colors.red, elevation: 0),
      
       ),
      
      routes: {
       
        '/anasayfa' : (context) =>  HomePage(), 
      },
      title: 'Material App',
      home: LoginPage()
    );
  }
}