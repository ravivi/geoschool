

import 'package:get/get.dart';
import 'package:dio/dio.dart';


class AuthProvider{
  String serverUrl = "http://54.86.9.155:3000";

login(String email, String password )async{
  Map<String,String> headers = {
    'Accept': 'application/json',
  };
  var formData = {
      'email': email,
      'password': password,
    };
          
  final response = await Dio().post("$serverUrl/employelogin", data: formData);
  print(response.statusCode);

  if (response.statusCode==200) {
    return response.data;
  } else {
    return Future.error("Une erreur est survenue");
    
  }

}
}