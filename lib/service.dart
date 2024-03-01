import 'dart:convert';
import 'package:bakimmodul/homepage.dart';
import 'package:bakimmodul/response_model.dart';
import 'package:bakimmodul/shared_fonksiyonlar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class apiService {
  String url = "http://192.168.1.105:81/api/login/authentication";
  // String keyToken = "token";

// ignore: body_might_complete_normally_nullable

//! burada login sayfası için bir post işlemi yapıldı apiye.
  Future<ResponseModel?> loginmod(
    BuildContext context,
    String user,
    String password,
  ) async {
    bool status = true;
    // ignore: unused_local_variable
    String? token = "";
 
    try {
      final response = await http.post(
        Uri.parse(url),
        body: {
          "username": user,
          "password": password,
        },
      );

      if (response.statusCode == 200 && status == true) {
        Map<String, dynamic> responseBody = json.decode(response.body);
        String? token = responseBody["token"];
        String? userName = responseBody["UserName"];
        int? userId = responseBody["UserID"];
        if (token != null && userName!= null && userId != null) {
        
          await saveUserIdToStorage(userId.toString());
          await saveTokenToStorage(token);
          await saveUserNameToStorage(userName);
         
          // ignore: use_build_context_synchronously
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        } else {
          throw ("Kullanıcı adı veya şifre yanlış");
        }
      }
       
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Hata: $e")),
      );
    }
    return null;
  }
}
