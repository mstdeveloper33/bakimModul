import 'package:bakimmodul/homepage.dart';
import 'package:bakimmodul/response_model.dart';
import 'package:bakimmodul/service.dart';
import 'package:bakimmodul/shared_fonksiyonlar.dart';

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});
  final apiservice = apiService();

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool butonDurumu = false;

  @override
  void initState() {
    super.initState();
    butonDurumu;
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Giriş Yap'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                onChanged: (value) {
                  butonKontrol();
                },
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                textInputAction: TextInputAction.next,
              ),
              TextField(
                onChanged: (value) {
                  butonKontrol();
                },
                controller: passwordController,
                decoration: const InputDecoration(labelText: 'Şifre'),
                obscureText: true,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  //! burada kullanıcının öncelikle textfieldları boş geçmemesi için bir kontrol yaptırılmıştır. 
                  //! daha sonra kullanıcının apideki bilgilerinin kontrol edildiği service sınıfındaki loginmod fonksiyonu ile girişi sağlanmıştır.

                  onPressed: butonDurumu
                      ? () async {
                          ResponseModel? response =
                              await widget.apiservice.loginmod(
                            context,
                            emailController.text,
                            passwordController.text,
                          );
                          if (response != null) {
                            await saveTokenToStorage(response.token);
                            await saveUserIdToStorage(response.userId.toString());
                            await saveUserNameToStorage(response.userName);
                             
                            // ignore: use_build_context_synchronously
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                            );
                          }
                        }
                      : null,
                  child: const Text("giriş"))
            ],
          ),
        ),
      ),
    );
  }

  butonKontrol() {
    setState(() {
      if (emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty) {
        butonDurumu = true;
      } else {
        butonDurumu = false;
      }
    });
  }
}
