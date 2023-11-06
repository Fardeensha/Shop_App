
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/intropage.dart';
import 'package:shop_app/model/firebase_helper/firebase_auth.dart';
import 'package:shop_app/model/firebase_helper/firebase_options.dart';
import 'package:shop_app/navigation.dart';
import 'package:shop_app/provider/app_provider.dart';
import 'package:shop_app/theme/colors.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = "pk_test_51NrwEFSIjiRqnTtH7lz5TgqdwX0uM8RU2gZ8dJ3VlXIMOj4oorGSO7fmMDqZR4d7jRnfQIeaq5FpLk7eGWhAQgri00A9N5QsSp";
  await Firebase.initializeApp(
    options: DefaultFirebaseConfig.PlatformOptions
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AppProvider(),
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            textTheme: TextTheme(
              titleLarge: TextStyle(
                  fontSize: 18.5,
                  letterSpacing: 0.15,
                  color: AppColor.titlelarge),
            ),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: StreamBuilder(
            stream: FirebaseAuthHelper.instance.getAuthChange,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return BottomNavigation();
              } else {
                return const IntroScreen(); 
              }
            },
          ),
        ));
  }
}
