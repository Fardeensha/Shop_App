import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/Pages/login.dart';
import 'package:shop_app/Pages/signup.dart';
import 'package:shop_app/helper/phone_auth.dart';
import 'package:shop_app/model/firebase_helper/firebase_auth.dart';
import 'package:shop_app/model/firebase_helper/firebase_service.dart';
import 'package:shop_app/widgets/dimensions.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  FirebaseAuthHelper _auth = FirebaseAuthHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Set scaffold background to transparent
      body: Container(
        // Use a Container to set the background image
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('Shop Assets/Intropic.jpg'), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 400,
              bottom: 20,),
            child: Column(
              children: [
                Text(
                  'Shopify',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.notoSerif(
                    fontSize: Dimensions.font30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: Dimensions.height20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(() => LoginPage());
                      },
                      child: Container(
                        height: 50,
                        width: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radius20),
                          color: Colors.blue,
                        ),
                        child: const Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Dimensions.width10,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => SignUp());
                      },
                      child: Container(
                        height: 50,
                        width: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radius20),
                          color: Colors.blue,
                        ),
                        child: const Center(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Dimensions.height30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        await _auth.googleSignIn(context);
                      },
                      child: Container(
                        height: 40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFD4ECF7),
                        ),
                        child: Image.asset('Shop Assets/google.webp'),
                      ),
                    ),
                    SizedBox(
                      width: Dimensions.width30,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => PhoneAuth());
                      },
                      child: Container(
                        height: 40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFD4ECF7),
                        ),
                        child: Image.asset('Shop Assets/phone2.png'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
