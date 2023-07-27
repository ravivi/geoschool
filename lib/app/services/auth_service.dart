import 'package:dio/dio.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'user_model.dart';


class AuthService extends GetxService {
  //TODO: Implement ProductlistController
final box = GetStorage();
final userDataKey = "userDatakey";
Rx<User> user_data = User().obs;
  @override
  void onInit() {
 

    super.onInit();
  }

  @override
  void onReady() {

    super.onReady();
  }

  @override
  void onClose() {}
  
  Future<AuthService> init()async{
    print("Le service a bien demarré");
    getUserData();
    return this;
  }
  storeUser(Map _data){
    box.write(userDataKey, _data);
  }
  removeUser(){
    box.remove(userDataKey);
  }
  getUserData(){
    final response = box.read(userDataKey);
    print("response=======$response");
    if (response!=null) {
      user_data.value = User.fromJson(response);
      
      return user_data;
    } 
    return null;
  }
}

