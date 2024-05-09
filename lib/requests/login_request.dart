import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class LoginRequest {
  Future<http.Response> loginRequest(String email, String password) async {
    String url = "http://localhost:3000/api";
    var uri = Uri.parse(url);
    Map<String, String> dataLogin = {
      'email': email,
      'password': password,
    };
    final jsonData = jsonEncode(dataLogin);
    var response = http.post(uri,
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          "Access-Control-Allow-Origin": "*"
        },
        body: jsonData);
    return response;
  }
}
