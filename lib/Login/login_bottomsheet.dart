// import 'package:flutter/material.dart';
// import 'package:shop_app/theme/colors.dart';

// class LoginBottomSheet extends StatefulWidget {
//   const LoginBottomSheet({super.key});



//   @override
//   State<LoginBottomSheet> createState() => _LoginBottomSheetState();
// }

// class _LoginBottomSheetState extends State<LoginBottomSheet> {
//   @override
// @override


//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding:  EdgeInsets.only(
//         bottom: MediaQuery.of(context).viewInsets.bottom),
//       child: SingleChildScrollView(
//         child: Container(
//           height: MediaQuery.of(context).size.height / 2.2,
//           color: AppColor.whiteColor,
//           padding:const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Image.asset(
//                     "name",
//                     height: 45,
//                     width: 45,
//                   ),
//                   IconButton(
//                       onPressed: () {
//                          Navigator.of(context).pop();
//                       },
//                       icon: Icon(
//                         Icons.clear,
//                         size: 30,
//                       ))
//                 ],
//               ),
//               const SizedBox(
//                 height: 35,
//               ),
//              const Row(
//                 children: [
//                 Text("Login",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
//                 SizedBox(width: 5,),
//                 Text("or"),
//                 SizedBox(width: 5,),
//                 Text("signup",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),
//             ],
//               ),
//               const SizedBox(height: 25,),
//               Container(
//                 height: 43,
//                 child: TextField(
//                   keyboardType: TextInputType.number,
//                   style: TextStyle(
//                     color: AppColor.captionColor,
//                     fontSize: 13,
//                   ),
//                   decoration: InputDecoration(
//                     labelText: "Mobile Number*",
//                     labelStyle:const TextStyle(
//                       color: Colors.black54,
//                       fontSize: 19,
//                       ),
//                       prefixIcon:const Padding(
//                         padding:  EdgeInsets.only(left: 10,top: 10),
//                         child: Text("+91 |",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),
//                       ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(
//                         width: 1,color: AppColor.captionColor,
//                       )
//                     ),
//                     focusedBorder:const OutlineInputBorder(
//                       borderSide: BorderSide(
//                         width: 1.5,
//                         color: Colors.black54
//                       )
//                     )
//                   ),
//                 ),
//               ),
//             const  SizedBox(height: 25,),
//                RichText(
//                 text:const TextSpan(
//                   children: [
//                 TextSpan( 
//                   text: "By continueing, I agree to the",
//                   style: TextStyle(
//                       color: Colors.black54,
//                       fontSize: 12,)
//                 ),
//                 TextSpan(
//                   text: "Term of Use",
//                   style: TextStyle(
//                     color: Colors.red,
//                     fontSize: 11.6,
//                   )
//                 ),
//                  TextSpan( 
//                   text: "Privacy & Policy",
//                   style: TextStyle(
//                       color: Colors.black54,
//                       fontSize: 12,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ]  ),
//               ),
//               SizedBox(height: 20,),
//               ElevatedButton(onPressed: (){},
//               style: ButtonStyle(
//                 elevation: MaterialStateProperty.all(0),
//                 backgroundColor: MaterialStateProperty.all(Colors.red),
//                 textStyle: MaterialStateProperty.all(const TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w600,
//                 ))
//               ),
//                child:Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: 45,
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 90,top: 10),
//                   child: Text("CONTINUE",style: TextStyle(color: AppColor.whiteColor),),
//                 ),
//                ))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
