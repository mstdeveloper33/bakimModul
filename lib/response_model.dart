import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
//import 'dart:convert';

class ResponseModel {
    final int userId;
    final String userName;
    final bool status;
    final String message;
    final String token;

    ResponseModel({
        required this.userId,
        required this.userName,
        required this.status,
        required this.message,
        required this.token,
    });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'userName': userName,
      'status': status,
      'message': message,
      'token': token,
    };
  }

  factory ResponseModel.fromMap(Map<String, dynamic> map) {
    return ResponseModel(
      userId: map['userId'] as int,
      userName: map['userName'] as String,
      status: map['status'] as bool,
      message: map['message'] as String,
      token: map['token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseModel.fromJson(String source) => ResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
