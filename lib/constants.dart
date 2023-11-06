// ignore_for_file: prefer_const_constructors, unnecessary_new, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/widgets/dimensions.dart';

String p =
     r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
RegExp regExp = new RegExp(p);

void ShowMessage(String message){
   Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.purple,
        textColor: Colors.white,
        fontSize: 16.0
    );
}

showLoaderDialog(BuildContext context){
  AlertDialog alert = AlertDialog(
    content: Builder(builder: (context){
      return SizedBox(
        width: 100,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(
              color: Colors.red,
            ),
             SizedBox(height: Dimensions.width15,),
             Container(
              margin: EdgeInsets.only(left: 7),
              child: const Text("Loading...")),
             
          ],
        ),
      );
    }),
  );



  showDialog(
    barrierDismissible: false,
    context: context, builder: (BuildContext context) {
      return alert;
    });
}

  String getMessageFromErrorCode(String errorCode) {
  switch (errorCode) {
    case 'invalid_email':
      return 'Invalid email address.';
    case 'account-exists-with-different-crendential':
      return 'Email already used. Go to login page';
    case 'user_not_found':
      return 'User not found. Please sign up.';
    case 'wrong_password':
      return 'Incorrect password.';
    case 'ERROR-USER_DISABLED':
      return 'User disabled';
    default:
      return 'An error occurred. Please try again later.';
  }
}


    bool loginValidation(String email,String password){
      if(email.isEmpty && password.isEmpty){
        ShowMessage("Both Fields are Empty");
        return false;
      }
      else if(email.isEmpty){
        ShowMessage("Email is Empty");
        return false;
      }
      else if(password.isEmpty){
        ShowMessage("password is Empty");
        return false;
      }else{
        return true;
      }
    }

     bool signUpValidation(String email,String password, String name,){
      
      if(email.isEmpty && password.isEmpty && name.isEmpty){
        ShowMessage("All Fields are Empty");
        return false;
      }
      else if(email.isEmpty){
        ShowMessage("Email is Empty");
        return false;
      }
      else if (!regExp.hasMatch(email)) {
        ShowMessage("Please Try Valid Email");
        return false;
      }
      else if (password.length < 8) {
         ShowMessage("password is too short");
        return false;
      }
      else if(password.isEmpty){
        ShowMessage("password is Empty");
        return false;
      }
      
       else if(name.isEmpty){
        ShowMessage("name is Empty");
        return false;
      }
      else{
        return true;
      }
    }
