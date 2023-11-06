// ignore_for_file: prefer_const_constructors, avoid_print, prefer_interpolation_to_compose_strings

import 'dart:async';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:shop_app/model/firebase_helper/firebase_auth.dart';

class PhoneAuth extends StatefulWidget {
  const PhoneAuth({super.key});

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  int start = 30;
  bool wait = false;
  String buttonname = "Send";
  TextEditingController phonecontroller = TextEditingController();
  final FirebaseAuthHelper _auth = FirebaseAuthHelper();
  String verificationIdfinal = '';
  String smsCode = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: const Text('Sign Up', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black87,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.white,
                  controller: phonecontroller,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                  onChanged: (value) {
                    setState(() {
                      phonecontroller.text = value;
                    });
                  },
                  decoration: InputDecoration(
                    fillColor: const Color(0xff2C474A),
                    filled: true,
                    hintText: "Mobile number",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.0),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.0),
                      borderSide: BorderSide(color: Colors.black38),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.0),
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.0),
                      borderSide: BorderSide(color: Colors.black38, width: 2.0),
                    ),
                    prefixIcon: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          showCountryPicker(
                            context: context,
                            countryListTheme: const CountryListThemeData(
                              bottomSheetHeight: 550,
                            ),
                            onSelect: (value) {
                              setState(() {
                                selectedCountry = value;
                              });
                            },
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 13.0,
                        horizontal: 19.0,
                      ),
                      child: InkWell(
                        onTap: wait
                            ? null
                            : () async {
                                startTimer();
                                setState(() {
                                  start = 30;
                                  wait = true;
                                  buttonname = "Resend";
                                });
                                await _auth.verifyPhoneNumber(
                                    "+91${phonecontroller.text}",
                                    context,
                                    setData);
                              },
                        child: Text(
                          buttonname,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: wait ? Colors.grey : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                    ),
                    const Text(
                      'enter 6 digit otp',
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              OtpTextField(
                numberOfFields: 6, 
                borderColor: const Color.fromARGB(255, 58, 39, 39),
                focusedBorderColor: const Color.fromARGB(255, 58, 39, 39),
                showFieldAsBox: false,
                fieldWidth: 40,
                textStyle: TextStyle(color: Colors.white),
                // Runs when a code is typed in
                onCodeChanged: (String code) {
                  // Handle validation or checks here if necessary
                },
                // Runs when every text field is filled
                onSubmit: (String verificationCode) {
                  print("Completed: " + verificationCode);
                  setState(() {
                    smsCode = verificationCode;
                  });
                },
              ),
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "Sent OTP in ",
                      style:
                          TextStyle(color: Colors.yellowAccent, fontSize: 17),
                    ),
                    TextSpan(
                      text: "00:$start",
                      style: const TextStyle(fontSize: 17),
                    ),
                    const TextSpan(
                      text: "sec",
                      style:
                          TextStyle(color: Colors.yellowAccent, fontSize: 17),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 200),
              ElevatedButton(
                onPressed: () {
                  _auth.signInwithPhoneNumber(
                      verificationIdfinal, smsCode, context);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                child: const Padding(
                  padding: EdgeInsets.only(left: 50, right: 50),
                  child: Text('Lets Go'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    // ignore: unused_local_variable
    Timer timer = Timer.periodic(oneSec, (timer) {
      if (start == 0) {
        setState(() {
          timer.cancel();
          wait = false;
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

  void setData(String verificationId) {
    setState(() {
      verificationIdfinal = verificationId;
    });
    startTimer();
  }

  Country selectedCountry = Country(
    phoneCode: "91",
    countryCode: "IN",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "India",
    example: "India",
    displayName: "India",
    displayNameNoCountryCode: "IN",
    e164Key: "",
  );
}
