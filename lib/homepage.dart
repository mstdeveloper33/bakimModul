import 'dart:convert';

import 'package:bakimmodul/loginpage.dart';
import 'package:bakimmodul/response_model.dart';
import 'package:bakimmodul/service.dart';
import 'package:bakimmodul/shared_fonksiyonlar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  apiService service = apiService();

  HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String url = "http://192.168.1.105:81/api/login/authentication";
  Future<void> getlogindata(BuildContext context) async {
    try {
      final response = await http.get(
        Uri.parse(url),
      );
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        // ignore: unused_local_variable
        var userResponse = ResponseModel.fromJson(responseData);
      } else {}
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Hata: $e")),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    getlogindata(context);
  }

  @override
  Widget build(BuildContext context) {
    getUserIdFromStorage();
    getUserNameFromStorage();

    return Scaffold(
      appBar: AppBar(title: Text(""), automaticallyImplyLeading: false),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await deleteTokenFromStorage();
            await deleteUserIdFromStorage();
            await deleteUserNameFromStorage();
            // ignore: use_build_context_synchronously
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoginPage(),
              ),
            );
          },
          child: Text("Çıkış Yap"),
        ),
      ),
    );
  }
}
