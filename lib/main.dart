import 'package:bakimmodul/homepage.dart';
import 'package:bakimmodul/loginpage.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      theme: ThemeData.light().copyWith(appBarTheme: AppBarTheme(centerTitle:true,backgroundColor: Colors.blueGrey.shade200, elevation: 0),
      scaffoldBackgroundColor: Colors.blueGrey.shade100
      
       ),
      
      routes: {
       
        '/anasayfa' : (context) =>  HomePage(), 
      },
      title: 'Material App',
      home: LoginPage()
    );
  }
}