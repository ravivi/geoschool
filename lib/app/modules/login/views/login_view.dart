import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
// import 'package:flushbar/flushbar.dart';

import '../../../component/textInput.dart';
import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class LoginView extends GetView<LoginController> {


  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }

  Widget inputField(IconData prefixIcon, String hintText, TextEditingController inputController) {
    return Container(
      height: 45.h,
      width: 330.w,
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.orange)),
      child: TextField(
        // keyboardType: inputType,
        // textInputAction: inputAction,
        controller: inputController,
        onChanged: (value) => print(value),

        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: hintText,

          labelStyle: TextStyle(color: Colors.black,),
          contentPadding: EdgeInsets.all(10),
          suffixIcon: Icon(
            prefixIcon,
            color: Colors.orange,
          ),
          // focusColor: Colors.orange
        ),
        style: TextStyle(
          color: Colors.black,
          fontSize: 15,
        ),
        // validator: (value) {
        //   if (value==null) {
        //     return "Veuillez renseigner l'email";
        //   }
        //   return null;
        // },
      ),
    );
  }

  Widget inputFieldPassword(IconData prefixIcon, String hintText, inputController) {
    return Container(
      height: 45.h,
      width: 330.w,
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.orange)),
      child: TextFormField(
        // keyboardType: inputType,
        // textInputAction: inputAction,
        controller: inputController,
        obscureText: true,

        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: hintText,

          labelStyle: TextStyle(color: Colors.black),
          contentPadding: EdgeInsets.all(10),
          suffixIcon: Icon(
            prefixIcon,
            color: Colors.orange,
          ),
          // focusColor: Colors.orange
        ),
        style: TextStyle(
          color: Colors.black,
          fontSize: 15,
        ),

         validator: (value) {
          if (value==null) {
            return "Veuillez renseigner le mot de passe";
          }
          return null;
        },
      ),
    );
  }



}
