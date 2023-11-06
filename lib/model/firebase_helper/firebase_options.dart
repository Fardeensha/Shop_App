// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseConfig{
  static FirebaseOptions get PlatformOptions {
    if(Platform.isAndroid){
      return const FirebaseOptions(
        apiKey: "AIzaSyANIdkCu2JHZaoZJMH0vX81-JX5hlEQji8",
         appId: "1:695136669390:android:c14fd03c2725915fae8a9f",
          messagingSenderId: "695136669390",
           projectId: "shopapp-ad523"
           ) ;
    }
     return const FirebaseOptions(
      apiKey: "",
      appId: "",
      messagingSenderId: "",
      projectId: "",
    );
  }
}