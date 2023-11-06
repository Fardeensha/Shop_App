// // ignore_for_file: use_build_context_synchronously

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:shop_app/constants.dart';
// import 'package:shop_app/navigation.dart';



// class AuthClass {
//   final GoogleSignIn _googleSignIn = GoogleSignIn(
//     scopes: [
//       'email',
//       'https://www.googleapis.com/auth/contacts.readonly',
//     ],
//   );
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   Future<void> googleSignIn(BuildContext context) async {
//     try {
//       GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
//       if (googleSignInAccount != null) {
//         GoogleSignInAuthentication googleSignInAuthentication =
//             await googleSignInAccount.authentication;
//         AuthCredential credential = GoogleAuthProvider.credential(
//             idToken: googleSignInAuthentication.idToken,
//             accessToken: googleSignInAuthentication.accessToken);
//         try {
//           // ignore: unused_local_variable
//           UserCredential usercredential =
//               await _auth.signInWithCredential(credential);
//           Navigator.pushAndRemoveUntil(
//               context,
//               MaterialPageRoute(builder: (builder) => BottomNavigation()),
//               (route) => false);
//         } catch (e) {
            
//          ShowMessage(e.toString());
//         }
//       } else {
//         ShowMessage("Not able to sign in");
//       }
//     } catch (e) {
//        ShowMessage(e.toString());
//     }
//   }
  
//   Future<void> verifyPhoneNumber(
    
//       String phoneNumber, BuildContext context, Function setData) async {
        
//     verificationCompleted(PhoneAuthCredential phoneAuthCredential) async {
//        showSnackBar(context, "Verification Completed");
//     }
//     verificationFailed(FirebaseAuthException exception) {
//       showSnackBar(context, exception.toString());
//     }
//     codeSent(String verificationID, [int? forceResnedingtoken]) {
//        showSnackBar(context, "Verification Code sent on the phone number");
//       setData(verificationID);
//     }

//     codeAutoRetrievalTimeout(String verificationID) {
//        showSnackBar(context, "Time out");
//     }
//     try {
//       await _auth.verifyPhoneNumber(
//           timeout:const Duration(seconds: 60),
//           phoneNumber: phoneNumber,
//           verificationCompleted: verificationCompleted,
//           verificationFailed: verificationFailed,
//           codeSent: codeSent,
//           codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
//     } catch (e) {
//       // showSnackBar(context, e.toString());
//     }
//   }
//   Future<void> signInwithPhoneNumber(
//       String verificationId, String smsCode, BuildContext context) async {
//     try {
//       AuthCredential credential = PhoneAuthProvider.credential(
//           verificationId: verificationId, smsCode: smsCode);

//       UserCredential userCredential =
//           await _auth.signInWithCredential(credential);
//       storeTokenAndData(userCredential);
//       Navigator.pushAndRemoveUntil(
//           context,
//           MaterialPageRoute(builder: (builder) =>  BottomNavigation()),
//           (route) => false);

//       showSnackBar(context, "logged In");
//     } catch (e) {
//       showSnackBar(context, e.toString());
//     }
//   }

//   void showSnackBar(BuildContext context, String text) {
//     final snackBar = SnackBar(content: Text(text));
//     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//   }
//    void storeTokenAndData(UserCredential userCredential) async {
    
//   }
// }


